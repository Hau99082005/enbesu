<?php include_once 'views/partials/header.php'; ?>

<style>
    /* gioi han hien thi description */
    .description {
        max-width: 200px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>




<div class="main-panel">
	<div class="content-wrapper">
    <div class="row">
        <div class="col grid-margin stretch-card">
            <div class="card">
            <div class="card-body">
                <h4 class="card-title">the</h4>
                <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="description">title</th>
                        <th>pagraph</th>
                        <th>image</th>
                        <th>id_the</th>
                        <th>status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php foreach($thes as $the): ?>
                            <tr>
                                <td class="description"><?php echo $the['title']; ?></td>
                                <td><?php echo $the['pagraph']; ?></td>
                                <td><img src="<?php echo APPURL . "../img/blog/" . $the['image']; ?>" alt="" width="100"></td>
                                <td><?php echo intval($the['id_the']) ?></td>
                                <td><?php echo $the['status']; ?></td>
                                <td>
                                    <a href="edit-the?id=<?php echo $the['id']; ?>" class="btn btn-primary">Edit</a>
                                    <a href="delete-the?id=<?php echo $the['id']; ?>" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>

                    </tbody>
                </table>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

<script>



</script>



<?php include_once 'views/partials/_footer.php'; ?>
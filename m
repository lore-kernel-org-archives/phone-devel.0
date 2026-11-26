Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719601;
	b=Wsy94n4IVs4gqqYNJ1TzxDYVa6C0rDu3/p6sDSsFWk8lfuz6fuWLWf2pYBxPnAXf3UFg
	 8/8HWkCv7J+EynQBQP4Wh+SweECioVFfabg+3BXk9u51Y264y6XfBwsVIsJ5MJWcyGuYZ
	 UIlEUp1C5f1ApQKBwxEA38pEY9pby5/9xgjEDI8eNXRjQofJI3dQjoURyAXUtN4n7HByC
	 bucoU4uk/WiyKJPBglOQPD88Lz30YN3UA5L8Gqy4lT2vdkiRPrgUuq2BlSc11IZaNe91r
	 nQnLvZ4GSdRO4gbYVfN+HOsyulLGIQPIGz0THhhAroiyEXNpK24zxEp0LigjtNaHFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719601;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=jWwv6SLgvSFFDCvgqquvmQoWH49kQLiOQm3ccYIx0dE=;
	b=XWe+mXS1YMVjHS2mDXip5IpNYvXot9XTK7c5xNnuJVKY0a9ECR2sNwCXIavEF5j8rAUb
	 NnFuYr471lFk/UAfQLlwS6UY3OWWkpEonq9nK8rKdbi28Fh/rF1xT997wyC55QncvDZ9Z
	 pACV/7nlNH9IPaFfAr3zCgZRgvWlPa+8EBwuo6tNEReqb07uL3Y9jL53dpotEyy2PCfEV
	 XZtfB7k7C1Ll7j2GlcWT7yJGjLPj1/DbY0q9RY3xu/NUV36hLEYFzqGBQe3nFoIp77BFY
	 dfxaZnFZ6DGVz+IsQxDQ8jC/7wqfrHTWdE73+IE63XqktVQpm4JFRDMZVCraHlFt22A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=tuuhb0vF;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A0606A31C
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 18:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=tuuhb0vF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1795719597; x=1795978797;
	bh=jWwv6SLgvSFFDCvgqquvmQoWH49kQLiOQm3ccYIx0dE=;
	h=From:To:Cc:Date:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tuuhb0vFEMYISj6momk35v/v5qgDBZAa9aFS+T+0Ev2OI5ww8BNcH6WK3qW684zKP
	 2jeymXE2Glo+raGlH3YCSPeYYB7QJW+hJU5qmCNzquiPAfOLtAAwOany3rIbRpwfKn
	 etOdvd5hzL49zboZ3MWarYgQDiuwN6IFj6SlklJpZGD3KfEazsuOJPHUfTuV9oPMSa
	 cTTalGhmhEycWv06149uBW8ifOQRCvTqflV4aHclb9ddrFHqFVGtJJuJLL8CbmLkbT
	 QHbW+uMeiimQg2D5n4hD135ExhilYcRvuJdMomZBfsoYHUb88xMQC9INknp+OdDrAc
	 J/gmCc6dr762A==
X-Pm-Submission-Id: 4jb5T80YqWz2ScX2
From: Michael McAllister <me@michaelmcallister.org>
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, brgl@kernel.org, zhaojinming@uniontech.com,
 stable@vger.kernel.org, me@michaelmcallister.org
Date: Thu, 26 Nov 2026 18:59:41 +0000
Subject:
 [PATCH v4] Bluetooth: hci_serdev: Unregister HCI before freeing the TX buffer
Message-ID: <179571958163.81221.18219121256319863408.hci-serdev-unregister-v4@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Unregister frees hu->tx_skb before hci_unregister_dev() waits for an
in-flight HCI close or reset. That path can still flush the same frame,
causing a use-after-free or double free.

Unregister HCI first, before clearing protocol readiness and cancelling
write_work. Skip the HCI flush and close callbacks during unregister;
the transport teardown frees the frame and closes the protocol and port
once setup and HCI close have finished.

Flush controller TX after stopping UART work, before protocol and port
close, so previously accepted bytes are discarded rather than drained.

Fixes: 21139b3ac62a ("Bluetooth: hci_serdev: Fix use-after-free in hci_uart_unregister_device()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Split out from the WCN3950 series, as Bartosz requested. Rebased onto
f57f78086ab5, including Zhao's flush and close fixes. Keep the unregister
guard in the HCI flush callback so close still balances disabling and
enabling write_work if unregister starts while close is in progress.

The standalone fix now flushes controller TX itself, before protocol and
port close; that flush was previously part of the dependent QCA patch.

Previous version: https://lore.kernel.org/179484638195.54009.16928291772826938293.wcn3950-poweroff-v3-1@michaelmcallister.org/

 drivers/bluetooth/hci_serdev.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 9f038ab65..dfa921afc 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -124,6 +124,9 @@ static void __hci_uart_flush(struct hci_dev *hdev, bool resume_tx)
 
 static int hci_uart_flush(struct hci_dev *hdev)
 {
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		return 0;
+
 	__hci_uart_flush(hdev, true);
 
 	return 0;
@@ -162,6 +165,9 @@ static int hci_uart_close(struct hci_dev *hdev)
 
 	BT_DBG("hdev %p", hdev);
 
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		return 0;
+
 	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags))
 		return 0;
 
@@ -431,6 +437,10 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 	/* Wait for init_ready to finish to prevent registration races */
 	cancel_work_sync(&hu->init_ready);
 
+	/* Drain HCI setup before clearing protocol readiness. */
+	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
+		hci_unregister_dev(hdev);
+
 	proto_ready = test_bit(HCI_UART_PROTO_READY, &hu->flags);
 	if (proto_ready) {
 		/* Clear HCI_UART_PROTO_READY under the write lock so a
@@ -452,16 +462,16 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 	cancel_work_sync(&hu->write_work);
 
 	/* Free any partially transmitted frame left over by write_work now
-	 * that the transmit path is fully quiesced. hci_uart_close() would
-	 * skip hci_uart_flush() because HCI_UART_PROTO_READY is cleared.
+	 * that the transmit path is fully quiesced. The HCI close and flush
+	 * callbacks leave transport teardown to us during unregister.
 	 */
 	if (hu->tx_skb) {
 		kfree_skb(hu->tx_skb);
 		hu->tx_skb = NULL;
 	}
 
-	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
-		hci_unregister_dev(hdev);
+	if (proto_ready)
+		serdev_device_write_flush(hu->serdev);
 
 	/* Close the protocol before freeing hdev (intrinsically purges queues).
 	 * Some protocol close handlers (e.g. qca_close) may still access the

base-commit: f57f78086ab54f3b3122fbaeba2c842ba7bb6d00
-- 
2.39.5


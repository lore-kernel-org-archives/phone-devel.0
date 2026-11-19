Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115896;
	b=rpjIy+VvhL5i8C9OtNX1Hj3sfHzA3jRiVOGrke6hCh1MUJ1s8P4hRs4A0KRpYiA4lGeC
	 vn4x6J2PKcJEnB4hjGTZO04b94Vfha6UkOMLn2+WnUqLsQuDDU61iMWYcQKm1G9PCJM1r
	 NxGL2zdcC7t35xwBjbFuOLebM+RwulLjgGtnojU8+URp9ZZgA2afb3auTjBCyRHucpkU+
	 cIpUWlfPcyRrKLMWI6hwZX5xsX/F3Jtd4csmXsKWqM8my7pwFgi0Xp22wYTZU/87xitga
	 fq3BMUnRqfnkBMyInNlJ4ZihBOtWPmWnt3kobZ9AQttjb2h2Zn+siJVMYQzUzeZnjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
	b=yr5AkDd6RQOcZgIpDOgUjvuEA31g9LdegToXDdZFS/Y2pzj/UkYqXfjs2eHyvK2XqKSH
	 3P50pj+zzq7Wd+q2kGduc6SWANY1XmAMAturKnDJbK3rQXYN700lZLvX/yM2fgphFQ6Gu
	 q35+MCcKHQC+UhFHOiBnhSWGDMAcK3fRcmf8LyQS7qcAuuac+ZuycmQ0dcBarrlttWOb6
	 LyeQ1oF4j+SH5WUcAxSdaCpdsU5bQrOLKiortc1Pp3r0XHmAd4a9vIB4Twz0LjCqRMnyM
	 hk0cN4Y1mtGY1KLmwyHeqR3Raqy7Ob6iag/MIMbQ0vOlhUHjtTp0w6ex49zXmbbTXjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yDbqjUqB;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFEC606A320
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 19:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yDbqjUqB
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so93105a12.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 11:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795115894; x=1795720694; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
        b=yDbqjUqB8/LIQbMMrTTmylORaM8GCLvTtIU4IxxHQOGwJvgrxbIC/bvsEypIPl4Pxn
         sLOBpEvn89kCCYo3rhA7/nZKfazVpJQOLk5q/hZ41kfXVU2CIee2gp+58245ghBIMSxF
         /ogAAeCeI7lHZXba1wkuPO0gjqXp/1T0qcZ5Iyyi2BdNoJL+Re5CzGOmXYZe8+Ydh81g
         lPcb7T7R/53oKOpeNNJZnORBV3m1lv4CeYhMIumhFHPNCRGXfh4qOKDsfX8Y2qHOwoab
         NvZLAr1cFhrpQUdI+zOInh1y5JhKlMNt8tUgGk6dCoQXVIxHklSh4SdsM2fUCg64Gf80
         MHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115894; x=1795720694;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
        b=TgYeVebdaaBW5+aSiyKNUq7wZpEkEWBjygIofI8ny6qFL5uYsoyC9KF3TAI0+4tHQ2
         b+o8qbFoh7RunM7m/5018ZSWN9XI1eSuQ6m06sVF0g3prJl4w38qPMag3QIm0TCJol0p
         3iVRTlsig69K3beGn4Q14xaX6i5wcEE1Tz43Tvxbf23F1Lj5A+VdOEZDpuZtz9usQiaN
         ljlyRiwXbh8iq1GwYY5+i5hAlLriN3K6ObPg1x5AIzfEOfaIsiCr0PQlwWAAqnNr0/fU
         PWmewfAMOxGeEvZSUIh00l6N/Y3YYb0nn3tjh/+i0HIO5b0yodNGrwkhwZXzqALVzU/R
         JY+w==
X-Forwarded-Encrypted: i=1; AL+hErEpATqGuQoGe2Vbi8vSjT8AxXfTQgE/gWyWdczK3IAVeR4f0lgfhx+QLZWC5KxhRmb6r5eT1sByhSYuKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/EqjCzh9Vhbi5pI0Q93d8liAM4oyZKQl4sot4YRG90LvfT00A
	KmLDpXOEI3skmL/o9NLrOwo3U2Q0dMsYm/5XWsLEidknsCi/zPirPE+Tgr4r/FpM/WtVaNOmPKs
	RFdlhRas=
X-Gm-Gg: AYBFou0zAt7Lrix9aaBBkNkpXzCeY8G+yPpufx3JNYXwuTtJre/Rki2uEQV4uCnNb5b
	ngqA8eonW9CxT14VidqZotEkS8peqeqhnZpldJz67iO8UAUwBEoKczVzyS2MNbvOM6ex8gG+JEd
	Pd9Gku/wXm/v81OHfMyivSUOxR/2RL8v5e7K8p5mBXZldZoOQE7QOKYYwdanJHs3ykFkWamgAXz
	DMsrLkdQTMnqOe4py08ZUucZpw5VPssHEQ7FFTt+rfEI9UMc8v5QlsGcYKvM6MVv5xdfCUoFr/X
	19G2Rcy8hyqXYNBzi6L8XJSiLz5915wLekYRpd23icbr/+9Yyl2O3bOsdE0vCK4uVFYDedQbGUo
	jna7NlzpBCvJS7gIdWYLCvSdA1w893OIImI47t+rthmrBRKhJJxtdwkO15m1zieWJ/gwAlxG8WY
	V3wqsVkY1TX1wU21kho0KoMx2Gf0w7oRx/fMXgU53qTxCdffvsK9uds9tEFEAqeP0GZf3wgH0Nd
	9HLBmHnYSZZ6sbMmLcIdV3mg+EK8oP24z/gXYhQEU80Wr8vLTT7zNpFyrzqezkB7MPrbKA5YZWS
	slqkrYxe8V0nFYwCNvavKKvrPZc+BS2hQhlKUpgU9bW+n6nwqL52LR4lt1zqrpHPo3v/2vc/ZYW
	avGVpMWVpcr4tPHm/XPPDWrpPOQ9tDVuAHF/YLUw=
X-Received: by 2002:a05:6402:540a:b0:6b1:c5c3:9624 with SMTP id 4fb4d7f45d1cf-6ba37e75559mr319355a12.22.1795115894304;
        Thu, 19 Nov 2026 11:18:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm217651a12.8.2026.11.19.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:18:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 19 Nov 2026 19:18:12 +0000
Subject: [PATCH] phy: exynos5-usbdrd: gs101: re-init PIPE3 on orientation
 change
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-gs101-usb-phy-orientation-v1-1-bf3c4bbf328e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHNL/2oC/x3MwQqDMAyA4VeRnA00pYjbq8gOrkvbXKo0Thziu
 xt2/A/ff4JyE1Z4dic03kVlqRbUdxDLXDOjfKzBOz8Q0QOzkiP86hvX8sPFcN3mzRSGEOOYKCT
 nHZhfGyc5/u/pdV036x4sgmsAAAA=
X-Change-ID: 20261119-gs101-usb-phy-orientation-44cc8f14f020
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

The SS lane mux on gs101 is programmed only when the PIPE3 phy is
initialized, based on the Type-C orientation known at that time.
The orientation switch callback just stores the new orientation and
relies on the USB controller to exit and re-initialize the phy, which
only happens if DWC3 enters runtime suspend.

If a cable is connected during boot, the phy is initialized before the
TCPC reports the orientation (e.g. ~4.0s vs. ~5.3s on Pixel 6), so the
lanes are programmed for TYPEC_ORIENTATION_NONE, i.e. as if reversed.
DWC3 doesn't runtime suspend while the cable stays connected (and
runtime PM is forbidden by default anyway), so the phy is never
re-initialized and the link comes up in high-speed only.

Re-run the PIPE3 init from the orientation switch callback if the
PIPE3 phy is initialized and its lanes are programmed for the other
orientation. Rewriting the lane mux registers alone isn't sufficient,
the link still comes up in high-speed only with that. Re-initialize
before signalling VBUS valid, so that DWC3 only sees VBUS once the
lanes are right. A failure is only logged, so that the TCPM still
configures the USB role.

Mark the PIPE3 phy as initialized in the same critical section that
programs the lanes, so that an orientation change can't get lost in
between.

Also stop storing TYPEC_ORIENTATION_NONE on unplug, so that the stored
orientation always describes the lanes: while the PIPE3 phy is
initialized, they stay programmed for it, and when the phy is
initialized again after phy_exit(), which gates its power, they are
programmed from it. This avoids re-initializing the PIPE3 phy when a
cable is plugged in again in the same orientation and the phy stayed
initialized.

Cc: stable@vger.kernel.org # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Cc: stable@vger.kernel.org # 6.15.x
Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2186b745d58f..ccaf0f27c4c8 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -509,6 +509,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @regulators: regulators for phy
  * @sw: TypeC orientation switch handle
  * @orientation: TypeC connector orientation - normal or flipped
+ * @pipe3_initialized: gs101 PIPE3 phy is initialized (and not isolated)
  */
 struct exynos5_usbdrd_phy {
 	struct device *dev;
@@ -532,6 +533,7 @@ struct exynos5_usbdrd_phy {
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+	bool pipe3_initialized;
 };
 
 static inline
@@ -1713,6 +1715,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	u32 reg;
 	int ret;
 
+	lockdep_assert_held(&phy_drd->phy_mutex);
+
 	exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
 
 	/* force aux off */
@@ -1737,7 +1741,17 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (ret)
 		return ret;
 
-	return exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	ret = exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set this while still holding phy_mutex, so that the orientation
+	 * switch callback can't miss an orientation change.
+	 */
+	phy_drd->pipe3_initialized = true;
+
+	return 0;
 }
 
 static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
@@ -1783,6 +1797,9 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 		ret = exynos850_usbdrd_phy_exit(phy);
 		if (ret)
 			return ret;
+	} else {
+		scoped_guard(mutex, &phy_drd->phy_mutex)
+			phy_drd->pipe3_initialized = false;
 	}
 
 	exynos5_usbdrd_phy_isol(inst, true);
@@ -1880,8 +1897,48 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 
 	scoped_guard(mutex, &phy_drd->phy_mutex) {
 		void __iomem * const regs_base = phy_drd->reg_phy;
+		bool reinit_pipe3 = false;
 		unsigned int reg;
 
+		/*
+		 * The SS lanes are configured during PIPE3 init, for
+		 * TYPEC_ORIENTATION_NORMAL or else as reversed. If the PIPE3
+		 * phy is initialized already (e.g. the orientation is only
+		 * known after the USB controller probed) and the lanes have
+		 * to change, initialize it again, before signalling VBUS valid
+		 * to the controller. Rewriting the lane mux alone isn't enough
+		 * for the SS link to come up.
+		 *
+		 * TYPEC_ORIENTATION_NONE (unplug) isn't stored: while the PIPE3
+		 * phy is initialized, phy_drd->orientation is what the lanes are
+		 * programmed for, otherwise it is what the next PIPE3 init will
+		 * program.
+		 *
+		 * Don't return an error, so that the Type-C port manager still
+		 * configures the USB role.
+		 */
+		if (orientation != TYPEC_ORIENTATION_NONE) {
+			bool was_normal = (phy_drd->orientation ==
+					   TYPEC_ORIENTATION_NORMAL);
+			bool is_normal = (orientation ==
+					  TYPEC_ORIENTATION_NORMAL);
+
+			reinit_pipe3 = (phy_drd->pipe3_initialized &&
+					is_normal != was_normal);
+			phy_drd->orientation = orientation;
+		}
+
+		if (reinit_pipe3) {
+			const struct exynos5_usbdrd_phy_config *cfg =
+				phy_drd->phys[EXYNOS5_DRDPHY_PIPE3].phy_cfg;
+
+			ret = cfg->phy_init(phy_drd);
+			if (ret)
+				dev_warn(phy_drd->dev,
+					 "Failed to reconfigure SS lanes: %d\n",
+					 ret);
+		}
+
 		if (orientation == TYPEC_ORIENTATION_NONE) {
 			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
 			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
@@ -1900,8 +1957,6 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
 			writel(reg, regs_base + EXYNOS850_DRD_HSP);
 		}
-
-		phy_drd->orientation = orientation;
 	}
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-gs101-usb-phy-orientation-44cc8f14f020

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


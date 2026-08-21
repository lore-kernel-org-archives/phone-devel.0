Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81E396B68
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296352; cv=none; b=L1tE8Vmp7lVLs64dkzXJE7jycMlG2BonlqUnhck/u0alG3YnqU6bAWaPJcfbTEYsehzNUTnrEpkgopleebcuQZVq3knHl606cC2MPUUx9zsvbl3zjuTTFx+kw3Utrzu2bAhdpxw3T1brCrD9ow1l7aDYFIbPFGN+CRVYfnl9fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296352; c=relaxed/simple;
	bh=fiy4GcFZdsC9yxetlH5+plrNHl5cqFDQooXiediiUNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+Y5EoxmfgXh5ONlRvkJFzKgG4suH9vhrEeto9shKrrNMj3pXraghaVw4NlrbI8w113kf67wLNTlxZmQTEfMiSYT+A7KHS4mQqc6JqPrCgQg+wc01RhxWImmXpitxdNUx5oex8R+ElFCkc64CsSagnoGT4H0puZkgiErctEzp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=43dfNpDj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="43dfNpDj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1f758014b8so70203266b.3
        for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296348; x=1787901148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnFsJCxkFM/wIQ0nrP+EeILR/FRzepb2V/4lDFq/FBo=;
        b=43dfNpDj7etKUvarBjFCNceUORIxr9OwLRJdY5A3V4ufPdhXu92eZE3y7eyJd+Vxd/
         lSasRrsfjMbSo3LF47XUYQqTgWzKPvNcdDRi1rh4c/acqjJUr80axHTLRW59RaLdgRoW
         nQzfFR9wljpDsV17UWrKu+fTtZp78dOnc/h7ajxHDk6OnCd16jbGfzvqEVUe6co+jXFD
         zntaiLyr57lGe7LHb2R3jCEySQKRWJpcvHOormROHR1VQ+pxaSrOpEgAdLAkcuSr6Kx1
         vL5/n9sTZByyroDFCqE4uJOQT6Zmmgt7Su/TIvUyRVgVGgQf9Z0d8akKNR0vg/bfFmk6
         Gz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296348; x=1787901148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnFsJCxkFM/wIQ0nrP+EeILR/FRzepb2V/4lDFq/FBo=;
        b=I9aXeGaDxBWZAwkp5RTeTDczWxRdI8dTGJfp7oWwnvaMrL5u2FQJn6pX3hHi3ybaqw
         W31Mcbp/ZT0ik/tfRmXFPlLLZFcZ86ijqu1/cDIesVefRebRXIA5Jd72NU97xN5iVJNV
         oY7RvjzQ04YGccaOJ242KVoXimVin/KyItKj0AzSdHDAwbx6i1fkqL6rn/JCmCjOpPxE
         2b0KumJzeJLCXiUZZdqSrCUuihqoJ0qg/amPbDGaeasCku7Y0rHCd2kgnXEzr/Ai3t4o
         ae/L1NJgK7VYXomJVVmdVnAxoCX4JGA5gu9pb08HwCSEmQup38+2zLmFMjv0lnAS/Lif
         9QdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4R6MAP9k//sORI6WkkUPU3/oihk87i8BM3wP4C8z5Do8ed5LGU2KywF/oU/1zRPmMT82fSyn1ovBonw==@vger.kernel.org
X-Gm-Message-State: AFuF++nzcV+SypvJzMoZ6M402Btk/FAULL5CgCWddcj4YinNVx8j5hR+
	8jP1yi9SbGnxCNmPXNnDlPekWa3yzS+wgd71faGcrRpQk3v65jd4bLcQeCTCANkszKg=
X-Gm-Gg: AR+sD104VRAT6xWTaYZfPZtZrTCN2FmzisjwnUHOH6Nz2+uPXfMskJm9gcIhW5KBrLY
	3aUq2z3ECk4hq8TxMehntOfojU7lsNKUzWmlZA2ie8qj2EVvaWSaLhahSBXEmcuxxudxHCdUe3i
	Qiv5ncyAZtJHT7MDrqNGA54dTes4pY604Ehc3qMEHS2aPiET4KiidhMsXqUdkX0vUf24Ved4w6s
	SJEd/oS5CLhXlj42SqfagriOXFLvvh11Q889ZNqdzUKyGbzr7064IMCKFOdJFxvEr8FXKgOu42K
	hKdfPyfp//NC99woQYPS+pUJIYvPcrxyDWuHsEQpkrdEiSajdokEe3jOduNcOW1RzTcIudJ1U+f
	eKgZUWhQ1DJLdrjpY9fSNdRyeesv+EQAVuywFlVV7nwsfucWjIvIC3klQRuIbnmmTu29MpP8oh9
	xj9FW0GiJT+/HAsL4kgTv1FK0GhAzmXe0xECnxzdsYzKA3qsBhkFL6pGeOLw1kTWwacM9JWmLpe
	x4q5SUhv4sxozl/51d9g9s8kmFCIGmZ08igdI+bi/Q=
X-Received: by 2002:a17:906:6a25:b0:c16:12ff:dc8d with SMTP id a640c23a62f3a-c246a69a22fmr393921866b.14.1787296348403;
        Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:19 +0200
Subject: [PATCH 2/3] Input: himax_hx83112b - Add HX83112A support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-2-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=3188;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fiy4GcFZdsC9yxetlH5+plrNHl5cqFDQooXiediiUNk=;
 b=7WvOSkB+YtikXSJZsjpEaaIeJ0pySPNkReYF4txiBimvkVap6UafneVGgaHcvM8K6ID8XIcbf
 M/ujWmt7PrHB6ANQxRMzVAZd3fHvWIZrngnt2rc6gx7b00XtZ+dFBca
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The HX83112A touch controller works nearly identical to other supported
chips, we just need a small dance before we can start using the
touchscreen.

For that a new 'init' callback is introduced to facilitate that.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 0aa67dfacbad..cc8b904d88e6 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -62,6 +62,7 @@ struct himax_ts_data;
 struct himax_chip {
 	u32 id;
 	int (*check_id)(struct himax_ts_data *ts);
+	int (*init)(struct himax_ts_data *ts);
 	int (*read_events)(struct himax_ts_data *ts, struct himax_event *event,
 			   size_t length);
 };
@@ -364,6 +365,12 @@ static int himax_probe(struct i2c_client *client)
 			return error;
 	}
 
+	if (ts->chip->init) {
+		error = ts->chip->init(ts);
+		if (error)
+			return error;
+	}
+
 	error = himax_input_register(ts);
 	if (error)
 		return error;
@@ -395,10 +402,47 @@ static int himax_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(himax_pm_ops, himax_suspend, himax_resume);
 
+static int hx83112a_init(struct himax_ts_data *ts)
+{
+	int error;
+	u32 buf[2];
+
+	/*
+	 * By default, the chip boots into safe mode. We clear the FW ISR
+	 * register and perform a second hardware reset to boot normally.
+	 */
+	buf[0] = 0x9000005c;
+	buf[1] = 0x00000000;
+	error = regmap_bulk_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, buf, 2);
+	if (error)
+		return error;
+
+	himax_reset(ts);
+
+	/* Give the MCU time to reload firmware */
+	msleep(100);
+
+	/* Enable the touch algorithm */
+	buf[0] = 0x1000748c;
+	buf[1] = 0xa55aa55a;
+	error = regmap_bulk_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, buf, 2);
+	if (error)
+		return error;
+
+	return 0;
+}
+
 static const struct himax_chip hx83100a_chip = {
 	.read_events = hx83100a_read_events,
 };
 
+static const struct himax_chip hx83112a_chip = {
+	.id = 0x83112a,
+	.check_id = himax_check_product_id,
+	.init = hx83112a_init,
+	.read_events = himax_read_events,
+};
+
 static const struct himax_chip hx83112b_chip = {
 	.id = 0x83112b,
 	.check_id = himax_check_product_id,
@@ -407,6 +451,7 @@ static const struct himax_chip hx83112b_chip = {
 
 static const struct i2c_device_id himax_ts_id[] = {
 	{ .name = "hx83100a", .driver_data = (kernel_ulong_t)&hx83100a_chip },
+	{ .name = "hx83112a", .driver_data = (kernel_ulong_t)&hx83112a_chip },
 	{ .name = "hx83112b", .driver_data = (kernel_ulong_t)&hx83112b_chip },
 	{ /* sentinel */ }
 };
@@ -415,6 +460,7 @@ MODULE_DEVICE_TABLE(i2c, himax_ts_id);
 #ifdef CONFIG_OF
 static const struct of_device_id himax_of_match[] = {
 	{ .compatible = "himax,hx83100a", .data = &hx83100a_chip },
+	{ .compatible = "himax,hx83112a", .data = &hx83112a_chip },
 	{ .compatible = "himax,hx83112b", .data = &hx83112b_chip },
 	{ /* sentinel */ }
 };

-- 
2.55.0


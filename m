Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676292E62CF
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280375; cv=none; b=lJwaA7DSeN9g52JMFmjfHkd1uplW9iDpkoc3qLT3mQfa+dhO7K8clpSv/0Kf9dPfspeARUPa99URnH1AaoJ/IhJd6DHFy3IqZy3fRqRxraiqU854HGPoQDoOf9KSsJK0m7iVjoDpbWuu4MhXhAvO/tiZTnOPRXcj8Z+u8hkMrbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280375; c=relaxed/simple;
	bh=QW2CvOpPX0RGg4TNbm/CsHQVu6u3IR3q1BZtVWV+tqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JuyhGxAQcEqPYnb4RFuCE+Yujl/ciFrfGXflRseOZSUZqOFz0QYqvjAa+/deHH/cEA1rlah4yx84EgjeVbLdxxJBfPfDpfTiBqF34lOc0OxzzvQ1wzJ3n9iu3R5HfLX6QF3n776FD/Xuh1MqbyJ4bOOi7jSQpd5o+vQiYi7tqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3V+cuQLA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3V+cuQLA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so11971028a12.2
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753280372; x=1753885172; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuMc2tx0byUeAusEePA8R+FLNCjRgYNAe/ZQenWndDM=;
        b=3V+cuQLAXCoi0BnsG7EBXju6fzcZk7nEBjIXnuFYObLTmLJ15JRK/NuhFgEFzoODF3
         zAN7iStH2XeQj5soOAHKuUfxgLgQFoRXh8f916Joji+RjHOrF09b63l1bZPd0JCzdMo+
         7EwYMZpHHHp1LPO1qGkyAq8WOotVi9rwhcmLm7ma1OYGYgAbBjHMh0lNBMcyGUwXxdOW
         pEsOhfbFnt6M9D54mX1JtotUYjdPqKU+fHjazKunwqPPHRc9NThnY/MIhv08fbR2rB3r
         Geyx8vdh86lVtwV0lE9qn95VHiNPbE2Q/kh2aYbSiaQ+PO3WkGTjAIAzCerjqawaI51E
         TvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280372; x=1753885172;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuMc2tx0byUeAusEePA8R+FLNCjRgYNAe/ZQenWndDM=;
        b=tzbvCFLddeBJ98KDNCAe2OMs2ZqdH7ua/uwcjFS+cEGgL4VIwwDbyevspErWoHWkl2
         R3pcUvpqEqJ9arop16uFk/Ek5Theh2iZYEAzzbGIIMisDUBGLf7CRiiKzKSJrrN0oOQ/
         2x6zLm2SFdnma88V6z46NrI0rbd2NNoMLShu0QsuZh1VGms1UCc01+O+7vPsDjHmuvDx
         w26x9IsOE8+I+LAeIqM2yiD5q2j7XZLCB+AagZvn4B30DJ7hGuj4LIn9VIoxhrMngNZI
         Vz2mcaKqIgKB1dFzjhYaSqzQaRoMySNIt2qD2uM9ms6mZnjvynOyaWb4Jxn0cu2FxVxq
         w4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLnvYKHBK/tAnqT5Vm2SVE26tt9KPSMp+uX0ycjx4M0lhckJhgF3QYeZfbP5KRSUfieKjooWpTWmDGSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNPg+j8B6jnSXa4pe9mP2zJiI5k52nZTWN4JgmHzdivNZjDjyW
	DxoJ2btaI/3uug375FSvuiQOl8CasgQ0s7Bn9XXpQ5inxES3+TtwO1XBYVQOUt8PenM=
X-Gm-Gg: ASbGncvR2W5TM/012L7404fEJj2b8fBlytsEAmHo8oIBrfYQ6kQy+Hd7uX+wY5UqA9L
	/aQTFTzm6BGdFxxwJvG/RMlFLxx4blrUqfsbea79Wb6ht2hvqC+LBi+t4s0Jq5Z3sumsUUWDock
	4H2XLMZw9bdOtED+vLP3gNbgWdEdOs4ycKU+foXl+bggJs5f/DQobPqKiiwNwFbaZM56HEFUIUn
	9rGbI/thFCtB1i4EXIKIBy6L1BdhJDqWWBS28XbRVQ/ULF+zxZsPCQNGVyqPnVOYNTX0tDWmS2h
	zuv++yNJAT4uugVjGmvQFL5k/4Y/RVz+YhFzZ2dkvkzokQXqdYaW4vO6FvtcErqRnJpfYN67wWl
	DJifCNKnqpxuK9kgSBEo1aYDO6Q5r0jJWdm4KqmoMTmFOSYsFfb0s3Sa0rFOiMMmfcvPGH6haTT
	AkdT4=
X-Google-Smtp-Source: AGHT+IHijsL9WlG4D6LnAPldkrlV2x7ROPiWCM0gsuvK3Z3YqcHT9NVWAy/PRI6Ld9Bq1jn5ZuV9OA==
X-Received: by 2002:a05:6402:50cb:b0:60b:9cf8:b218 with SMTP id 4fb4d7f45d1cf-6149b40fbdemr3169269a12.7.1753280371626;
        Wed, 23 Jul 2025 07:19:31 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f37026sm8667447a12.25.2025.07.23.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:19:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:19:22 +0200
Subject: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAGnvgGgC/zXMQQqDMBCF4auEWXdAp0ioVykuTDK2s0hsM7EVx
 Ls3VFz+D963gXIWVujNBpk/ojKnGu3FgH+O6cEooTZQQ11j6YqL+3rUaIk6bG+OrSe2LgSoj1f
 mSda/dh+OzvxeKlqOEdyojH6OUUpvEq8FTxiGff8BCc1/Lo4AAAA=
X-Change-ID: 20250723-ubwc-sm7225-19be7c2e7bdd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753280371; l=1334;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=QW2CvOpPX0RGg4TNbm/CsHQVu6u3IR3q1BZtVWV+tqQ=;
 b=t8MCkD9P0tP6KMvC+0Hz2ljwAISBiLZSQo93HAmnKuk7O9nq9mbLlWzY/h7ViD/JtPd92TzVx
 haCefpvuLYqDgFv9oZOyeTeEWr48khNhuLONkM2WCwBCbZBsjeszdFz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

SM7225 is a variation of SM6350, and also needs an entry in the table.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Note, due to other bugs on next-20250723 I couldn't fully test that
DPU/GPU are working, but this seems to be required in any case...
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9fdd169f87a78a486bea8823083bef08bc5b9521 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -246,6 +246,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
 	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
 	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
+	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
 	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
 	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
 	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },

---
base-commit: ac3f0fb04c50a909908fd375686c5ad6b27bee98
change-id: 20250723-ubwc-sm7225-19be7c2e7bdd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


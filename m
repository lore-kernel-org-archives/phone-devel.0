Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB612E0B4F
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842911; cv=none; b=LuMwzUA8AOYZ4cJvNVi+EWpYA67uqBM8OjI6zyg8liODXSVdc7safuyHIp6CMO+hyd+6e7Cfd/TpKpc7xLNaohwoDC5vg3VMT7+o5W/LnF+zvJeqMwyOhzO4DiFHJKtremt0PvZfvm9cUkBFhK/p3dZ1YIB379z8Fo0c9Kd3fUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842911; c=relaxed/simple;
	bh=ga1S1Xr1XwnMLdKu7zfWrQr/T730QEOJZ68b87o6lys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxuBQSfSIuDTGQis5L7gkjr/BXMXe2q66Df7Z1yX/L1RThsQKNlcnfpbU1WUjNvI++OAFoyCgcx63pm5jzl9bD6xqHqXXLYt1hLZuQ5AyNgUt8ibpIpgJVK1iCV776EAdlW/I7wqt2cX3KTkKRvcdKwjeKzlC8QsODEcVd6xKnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4l3WZCcJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4l3WZCcJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade4679fba7so239590566b.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842907; x=1751447707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUNu7081NdSEDseAX1Y3e1QHYtmHZCwU3VvPUFRPHLM=;
        b=4l3WZCcJUQZsb7YoW3qY4HX4BeJmjQ2e9BmvSP7DvoSr2YiXZ7Ccln60wxVihpNoeA
         KZbxjrJtFbUXcGRAaDqRqzuw9Zx1mRp6d15FZptaychRuwqtGE7QkhPoP7Of27SUuAs/
         pHWe9eNGxWrD3Sz+bTpB9uDNU2PMgflqeBZcPgWWzlgGIjBvmFJbqIdGCko49Zej+Imz
         f1TihDLU7tDZZIzbnkyh7W4t9HFkE4x64zIzg7jWAWOgWtEpQ0fSabryNmhxsh1ZIlre
         XUhs2jr0c5W5POEyfBn8vfxBHIxYhT0/k47V2v1YrZ9uZnml8oM8kiNanCoGSfTLnlS/
         FUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842907; x=1751447707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUNu7081NdSEDseAX1Y3e1QHYtmHZCwU3VvPUFRPHLM=;
        b=iCnOaEsfTXQBu0rbZ6mDgmMGGk1aayAnrRcQ5Yj06BZOW/fh65IMTO9gg8iER9/Byd
         4IENa9+6POK9NJTQIV3gKZUjvvqnATXqV23HCZm65h23n20mm7lnyDhiMihgg4pSVWq7
         hmUWBQyjoTM/M8SI/nJyUKfYcXM+VShLzkNXTq99hjD7TMoqcfxXBhgd21fS4/fcQww3
         uE5xw0nzRzgJQIcRQfqVdwtlavSA623RgQLcZ4tMxaCs79PudhyR7bOnI0jFuTl30cIL
         5MWsKlFusIbCWSVM5XgQ9LrEPM3MX4BjEWpyo1WUX+ch4+ekfC6pwfTz0XD941tjH8vU
         GuKA==
X-Forwarded-Encrypted: i=1; AJvYcCUmnWzoZaPmENAnblX+7r1DcXq1noqz+LQUllaZmoIZnLOqXWNr4ti/0vIYot18Ym0GTiZtf+lOG5m6NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLUj06uXFy1xufC9U9izlMEu2Z5njIeKCm7pToqgxul81/Wq3K
	sRooxikk61oGQRxfzf/7aKIC0qvFHvd7MxP7Wf5auDeov2upmSs/D+Dcz5GwUzz+KYA=
X-Gm-Gg: ASbGnctrJHBplE58rrxGTPYV/zNqHtV5JdG92SVoJfd1P+jHteJps4Hez5VS78vrAi9
	Lj3HpqXek9jy4MJ6pfH2P9UaYwmKV+1gysokytWp5M04+sGrQZDZvbvtUxQLEo68kZoxfKNffsY
	lB8zFmmeNsBMbfzk0uov91g3Y/LUksZgs7lCPP63O0tiJSbfDenl3p0upU8k/1IsUUx4C9nDa22
	mGkQPRNDYSJJ1F3sFsepzt/4lA+LoFCeKChkwsSPdLpKFdH+gSOzg3gVggoAcRMsskVa7d7IeuX
	T7E6Cg9IHXlI6hWt2SECFDi+InpTWo7zcKhZOpmLAQW8PXYkfrEpsJRIKQfOz9uhEJ3+M/Q4vM/
	MZRQWLckmQbmC9ymY+wLK6hGNXsZM/qKZ
X-Google-Smtp-Source: AGHT+IEuwwPgZRVwpV0E5VzCi3XFCUhbcyDfrIuNNO6Kwzrn10Xq2xPkywwIm3YPQY5laniWK8XBgw==
X-Received: by 2002:a17:907:970b:b0:adb:4523:90b1 with SMTP id a640c23a62f3a-ae0bf01a47emr226738466b.23.1750842907077;
        Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:57 +0200
Subject: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=1083;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ga1S1Xr1XwnMLdKu7zfWrQr/T730QEOJZ68b87o6lys=;
 b=8ytXcaweUPvgAlxdOOzwHq/Lo4rL98hebjV+yYGy27o+H8VskHWgSQLto1TFmtiLWV64CnvTb
 hsS6OQkxPVLDMP9wTarvkEDCDNQLNLFZx76E2jESFwtOG5cmMcEznGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Support reading the FS Differential TX Output Resistance Tuning from
devicetree and writing the register, as required on some boards.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index d7493c2294ef23e37e484019a49ddf7b3d6a6a46..61594739e5b12706775622e1f76af6ad5d2d29bf 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -136,6 +136,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
 
+	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
+		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
+
 	/* Wait for status OK */
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
 				       poll_val & RPTR_OK, 10, 5);

-- 
2.50.0


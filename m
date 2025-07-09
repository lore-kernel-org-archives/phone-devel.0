Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE12E6D02
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072929; cv=none; b=tn1AJCbT4+k2MBjf/auCbi+7uAAD6xgvPM9XgyMF+QA5IEtdyB7hE3Or902+yEybw1CImfbrHhWYGkKX68OAvPuYKoZBfczuXXHbrKp4OhhL0uvY/CJ7vSkM4j6KvJxM9SbvbsiPrU51WKGUkTMNPR6mJcS5VJsq/MGjDoizkzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072929; c=relaxed/simple;
	bh=JjK37/7ou8Ub4yuQzbdrYu/+a8HXwLFQlJ7GCGIoSKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uf/7mP0Lmqj4YK1mcht5MEpCt9LIrItREpU/gxpNGI0QtBx/5nIkM6OKJfAQ2jwVLY0a/WgY/8nvREwvOg9PazRX61nRDRccOfuoyL4jWMOKaboIl9Lr9eFWJdS7bVcV6bU2G/BTA4IbGOJ+Ut/KOoUHR309Pe2VfALFD//z144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G2/wTAhW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G2/wTAhW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so8002348a12.2
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072925; x=1752677725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqUnckrV2DHR0JIRkRD40uIY/f6Qb0J4rvTjJoaYqS8=;
        b=G2/wTAhWzSamOvQZZmw1tZalAIExmzLA92jJ4s96G2FxsX9D6IDLry+yOxzIPIiFkL
         cpbEwPnisAa89f0FULNEFxVtHK04GId/bjyb5Ith3GQFCmxLbYDXc95xl+RCwGM88146
         teocst8VOAlfrJPyLY1nI4IRSLz4MnYIHUJ3sU3/WN3qrXAgb/WVEkY0ppQsjAcoQnx/
         wMoVGaAhUVOV8Mc8+CeO0SKGSZrtll7RWwZrjUniH5mlioCtIKj0AukzKMcY9hIZOqvZ
         ZC8ub/Epl9gA5wnH1dp9L3ggx0a8lM0VzhxyxW80sSRC4269Wrp+YXAe8PbmeQJg2mic
         Gb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072925; x=1752677725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqUnckrV2DHR0JIRkRD40uIY/f6Qb0J4rvTjJoaYqS8=;
        b=tX3mYODYRgzT8fb7Cp1kI5QHqXildj0w+/mqh2ofINl/Ea0FK/JTtXnMi5iiX4lV4l
         VEgEHYrobTvINA16vsysPeJANs37v5w9J1fXzyW3fw1U3dgfH1c1NaqYD+PvQF+1vw+z
         x9STZErZihFIGrgVs0puiTa98gXcIRXqiRcRJqujGRQZqdsU3Wtjem7eYFQ3a5qkWhuu
         o36F8qEA9Sz12gUGvRGITrnsPvbau07McohEULQG3lxpGiLcyjkJP984UbspyCR4VC1a
         n+oejep2Lo0H1FtyoGKbeoNhYqOTptk8yGsZyskRJ967xeOYllw7w8DhUSIT1Tg0Pe6Y
         dAew==
X-Forwarded-Encrypted: i=1; AJvYcCUVBp9aXE23b/MhX+orH2U7pLz+QI4jQkktAgWttunMxQW9yScIk8AlpDK+5VBF+ETt+0XTABlOiaqIlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAQxcktFSEXg3zNdsQPUQ1E0wzZutTNkzlqnBKsRKEsY2HQvs
	nszcmMyv6KfoU4vR0DJ3YhLr4Z7fIP4giaKPwlkebMA8IvSJVGHdZDD8mEFaBlkpge0=
X-Gm-Gg: ASbGnctfJr1AhDVWzYCJ3sMERba9v6HaCPpr8JMUHYPt2YSIltbtD/4Fvi/isK2iCLE
	Zp997qwQ8NPFS8TkxLcBEI9gMGONF55KTk//IBoiQzHRFugEsXByBIGzemrYUTJegQkqn1cntjI
	mKLj/OF/HGsv9GKnF60bWtDA/OPnPI3XGZG5vCBIoLGdm3jG4hzM6B9R2aRVNwZJvkVbRlJKgls
	7zgF47+p73XXZngdSsjGy3WM39bDbLoZm+S9FSbgK9qZdu8F/lN2oWj92WfIwAJk4iULsg/d7Zk
	6FZ++GFWU6zC4fzpUZSHrQEX1pT+EbBWs14pmQ0yjo35mb4YsCtT1fg4XgN8MDmbCfeABV3JVi1
	GfQkOmD44E4fWbKVk0t06TpZE/fm+8DrOhGBnq/wsswQ=
X-Google-Smtp-Source: AGHT+IHYj4k/qDDYaJjD9Pvlt5hW+aGvDzyWD8yDesgLcfq/4kuKmOi8Z6ujnsY58oHIu98v8zVcqQ==
X-Received: by 2002:a17:907:ea6:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-ae6cf6128f6mr309110666b.24.1752072925389;
        Wed, 09 Jul 2025 07:55:25 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 16:55:15 +0200
Subject: [PATCH v2 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-repeater-v2-2-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=1187;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JjK37/7ou8Ub4yuQzbdrYu/+a8HXwLFQlJ7GCGIoSKo=;
 b=a4O39biLPv1ckqefPreNqneOFtzOmXRAtTy90P3R2Po9bjTLgvaXw8O0srrHGpicIbkBCZwtq
 GMA3OKt/wNkAXcOlHdD0WJfhA5Q0vh5eGp6Mfjp75rWf3jKut3x0cbF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Support reading the FS Differential TX Output Resistance Tuning from
devicetree and writing the register, as required on some boards.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


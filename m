Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41A9274B31
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564593; cv=none; b=uLG7bvLCXYOn6+5pie7jnF2SVU42xhvCi6UKbNUQITqXQj2F43EtVr7/Zuhj/iQG5gh3pTbQShmMdIeo6E/EWabAkuLAr+bUw8FAqc9Ylk3I5pO2qc0gVRePZGrbCUrddcKMbsVDRWXWvJfDJT8dj1VcdwiU7nwJOoLhgkSTMZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564593; c=relaxed/simple;
	bh=sF0BBqSfmmjGnkvMWcmZuM22C376Bznvzv1cD7u8WVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezHh1JOMwWqK47MaXtTzpH/7/z07DryTc3TcUNTM9TKxOqhPr1Zl4NaTGx5Zb/xwsfN/K5EmQPKLSQaqJm4mNVQCD7gEtxuzszag3yVCaHlTnXM7XyGSbOKEzu2oVfG0RRWene0VkHUuuW0Q/BCfDu3GOtbR0DcAezA2N+vqv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BGYnPXzJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BGYnPXzJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b45edf2303so4380442f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564589; x=1753169389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMdbbj4BEowCYzs/Z3M6B78NShV/42oHTUmjX6X1bd0=;
        b=BGYnPXzJqVh5O2j8Zp2czkrFZebhECxO+QZiatbUk+MX57bX1qXDVHy8/WVgiuxWyv
         qCyT8pT1M/SjIT9gZNXhwuhM9P2pctwTphybsKo2HXlWs56iwAyDUcHKR3PWNLokktzg
         IB/um+6zfynUQ7GTywEaCXDCyOcHCOp8VZhJy3V+b3qqAn755s93eOtrbc01ZvMMTrle
         kVjU3IXQeJrgKbb8HPWPDUilk3n4FL1as2/xnmYAuBzIWoyWv7ITERARInI2SMBTBQgs
         Z/6QqjkclDGxrFWMQhrb05Op8HRRBBUIPaEY1VDZF9A6I3u7TSEjcy5pYQAtNLkTLb8Y
         S45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564589; x=1753169389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMdbbj4BEowCYzs/Z3M6B78NShV/42oHTUmjX6X1bd0=;
        b=Q48ZdGzr36TDEaoQJOiqU1SnXhRbZkP6j/jfSJgWuOMZZs44ErpMh62D54LJ7bQ1NW
         79GslHPQZ+8IqC3v76XSzo3xAa4mEaOzp5ewimawUksZDmkZMvd1F/p+1VfdDFoUzMbx
         Cx8Y1Uit30bYN8z+78su3OmdGRNsXlCkhttJQwUTAydQZc+WDTGx2qe4EGgeGuIM5U6d
         1IFAo3jn2U4fL4SX/a8Liwv7+cliKN6oJHBm4pSuC7mMK/hDnlSyBwqMRRljtq3QXlh+
         mRam8Xsom1aU297fGoX5uEI7nbZ5d9Bnq6WBm3O+y2uQwk2eKStdZOFdGvySSq2K33zc
         2/eg==
X-Forwarded-Encrypted: i=1; AJvYcCXx28t77R91di7o58mNMpWNjBpMBXzb83Mkfgy4a1S80R9aRBvWx82gS0kgulDffcT0N7NPzSUovBiT/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPQIXEfW6hUd+mLTMsM0IsXve8O8/AT/mD9u+Hr4FVBOv28XX
	MSZM+mW5e7dFg4f43fMVrauQCWV3WpAN7wK8EdDUxZt5UmmDzMa94kCMRpVQPx1L0Y4=
X-Gm-Gg: ASbGnct59G9rAHUWZoi8z6xShg1pVDgmPidbZuuuj+ewpxekNNGCnQhOU7386bzUofH
	/oEWZzDnEbfNCcGKTaf7W8FEJgVaPy6XrineFUFvbiWC7v1knkspP+8D66tDNTS8LmV38MY4UZz
	Y4SsTzewXdd8MJIiuCkBbqaRS17ZTVeNkCSTzEQwTKJv8P1scySrt9meq8L7phL+jMIuXuk55HQ
	L77OPLWAUTzyBzkdNzAqtGyfKOJpgRp2v/EVodI2a2gPXRhGG6hV2vUvDMRfU4CZLrfPLxwJ3G1
	iA0cZ0LlN95xKAMahgXU+rnQ9C2es5mTDKdcIVjnFL7Zl2W3ojcHCcTe8vMQANn8NnEDUxQUfpH
	slvi3/ny9Ky9Uaj2plMYNDbLyWOOWD1QhPw7WLsAW3V/u5TGyRmSt8PkM
X-Google-Smtp-Source: AGHT+IH7xZihVzIA5RnWD6NyU0bUqw560Kv27vVv2rhTAzSisPpc8YG7ahtot4M4YwZjZtNx8Gr9kQ==
X-Received: by 2002:a05:6000:985:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3b60a1bad1emr1118577f8f.52.1752564588929;
        Tue, 15 Jul 2025 00:29:48 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:34 +0200
Subject: [PATCH v3 1/4] dt-bindings: usb: qcom,snps-dwc3: Add Milos
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-1-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1322;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sF0BBqSfmmjGnkvMWcmZuM22C376Bznvzv1cD7u8WVI=;
 b=kWHGuSS6cgAT+8EY14LUc3Wr8wswBjOovjk3j3OcaOlQzDYtixwgSAbOWluwm+7/DADGH77OD
 /ATYlXH1wgcD7S06O+brsLKzuyArP0bc9RfmMxcb0S24PBta83t8Lqx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Milos dwc3 compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8dac5eba61b45bc2ea78b23ff38678f909e21317..dfd084ed90242f0e77cb2cde16023c3421c5dfab 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
@@ -338,6 +339,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -453,6 +455,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:

-- 
2.50.1


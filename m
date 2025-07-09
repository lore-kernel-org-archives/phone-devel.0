Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117E285062
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052726; cv=none; b=jr4cYCIyM6qKS9V+Jvvo/wridqmdA/WLItAa/k3P8GB8Gh595kT/KN7HoJD0UqXdenpi/l98swFac8Y473IiHZuICqIxkpN/vNNvVNT8o9gpM7EJZ4RL6Kd7M0AOhl1jiwTCAP7GD/MgRQFGzUPZnX/fbA07MN5yuGLS/B3/Juk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052726; c=relaxed/simple;
	bh=N1DuyPNcj5JKCc1IHvUuzahkrwJboCfhgqDrPUo+Zic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8MdwVK42+JW1tDmB5JYkOgW6ligrZyR46OG4wEE85QR8CfeihN6EoijXXi+CSL5dJ4dwIGBCuy+fbZ0Dg/betpYEt70nYUGWGBhrymjys7+ZBuFl9TtLv9yZ2G7G1hXHA+9maC1Yth5cTF9vp5BfGG78Tf/GgJB3N/MAo3jnFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5kOdlUBY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5kOdlUBY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1139311266b.2
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052722; x=1752657522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YzGffSdl0SelALHaNtnKuFhO/J9qLrb0FjuAIV2ya4=;
        b=5kOdlUBYcOsuIB/hCmWJxrif+7v7Ne3pKpNmfpcSf8/diAlBwk5iIcjTJIe9QS47wc
         sMTlH9H72c6pQ+j5POhsHs6z49htzyqoR88BJkwKdOeGBIXLE8lJJNumJ3c3DGys50uu
         u7ofD0Udk+Az8BE4+OsiAZ34qDjldOwSU04iC+crYiw+QfumE/OE/N2V2nEPV1l4UtKa
         Ar+z7fxHkyAt+95b/EDfiOOsAYXyQg0WavGqIX1U90JEGNxzbuSRPqNodlSE4K3mw4jB
         cxmqF/zPaxesgLzjUSZSfJ8APMU0QapEWyT6U3HxlyiHla+ih8WWnN0xStTX0G4zm7No
         rpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052722; x=1752657522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YzGffSdl0SelALHaNtnKuFhO/J9qLrb0FjuAIV2ya4=;
        b=auTuTaZUIS83xNVgpo3tsRuhyAjb4AE1uOStcd4OTFA8FbegdgkEnzM0zFleF3wrjq
         RSBYj5sZCKJCdqBT1dFGCmDlePTVI4AX4jEV/9u3mlBMnMP+cowIBX2Sd0EFYv8dz88/
         dxd+a7Uqgqzr1+de47DUa8LUGsgMYpC5nAaohDaXUviZxTm+tDZ/rNdplSdRQziLf96Z
         GZSYTrZvfjgewo6zZy0HZj1SY4H2EZrrvXb5RlqNNnHz+eHxAxEU1X+bcGdIExqNATvj
         XvMfwkz5mBHrZK283+cdOw2nOl8yDN6Z0ionp7T0/Fx53tAIjZwairlLL/kMNO+Vu4d5
         bTVw==
X-Forwarded-Encrypted: i=1; AJvYcCUxdhhEAw0/inMzwiiHwMmtCM/xKbLIAa08jU7Wy35tG0cDEwEcm0MfQvEvtxk843f8Lm2mx1L7AkmotQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSpqXNppBHa7lfjjXYo/o4dW7lSrsV3lsk3J1FAOdTTHDkUx/B
	r1wvUe7Zvvq/UONwwV17SOOoqls/9tRIiA5USI3/FDLAPNw0NjNysstlj3TSOz/O+Rs=
X-Gm-Gg: ASbGncs72dSoO+6O6BhVt4MIvZl+fCCnl/wDo/BdZ9PRAJUVYtMuDPo9FcMeWn+ROev
	cXe+SZC/oMzQBCMfo5fRdki1UlBGdBj2Z5kvx6yIIRtr8xOp8Vl66YqBL7WxMdetuaQRS3KO82+
	eHUdGbwiMKNAYZKQW/HZExVvn/l/BGivxBw2cmWsP7If7edAJnavweI56qFhu+3hM00os+VcZ/a
	9PTARPpQArFjWYu1ENqcZlj27szDWk7WIFxAyLrnh00U0V5X4wmlYRxDb9jlrEPxSvO8wdzaXm2
	uoZCYrOmffZ4s40AqGpwW3HScE5SFKE7WP+TVO8dQ47M5tobVL4br7J6in5nxIa2WPjFbyl080Y
	dFsbwHsYS6POiqhkEnQGeJBdRN2FJrP2X
X-Google-Smtp-Source: AGHT+IHxUaM+C2R6jkXjJD6rCqMOZdTnVavMM1pgYMFVzDnu9HtXv6fIbTrykY0qZGIVD/WAolgKPw==
X-Received: by 2002:a17:907:3f17:b0:ae0:bb16:1cb3 with SMTP id a640c23a62f3a-ae6cfc3e135mr185121566b.51.1752052722372;
        Wed, 09 Jul 2025 02:18:42 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:15 +0200
Subject: [PATCH v2 1/4] dt-bindings: usb: qcom,snps-dwc3: Add Milos
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-1-4790eeee7ae0@fairphone.com>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1258;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=N1DuyPNcj5JKCc1IHvUuzahkrwJboCfhgqDrPUo+Zic=;
 b=rb96OCei+nJnNOyzP4b1MNdnFGw98NO2wwz7mhvHHcJLFGHhCzGptxQ88EaQxQvSSui0OygF3
 0BbqX2XwpQhAMBbPnBeOAM30ehgBH0np3JfuopEX/Zk0s7vD8pLqeUn
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Milos dwc3 compatible.

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
2.50.0


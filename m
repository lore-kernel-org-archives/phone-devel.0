Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577289;
	b=O50CkCHf0EAXUgv2vsDpHKwD7m5PSv5rOtcXM7xT35cqE4DkCGDua+ybDqtKZh3FdZU7
	 v649LSaqpE/D8XKOEV2Yj7ruV4l2K1gzarNhYy9dTIhyR8bby/FVUjs52I6Mn1F7GMZX7
	 BWGdKYdBkVCR8saXlR3SixDHzMtyPFt5qLqJ35SmgzOjJAIM/7YD+NlYtgBIH/OCDmOsK
	 MDwxr9wVcoTTKdOu9l1DYkKAErkmkK+7R8ARdu3Mv8BwFoLRsnAUxeBurpiXcDiPvbeBK
	 qhTnrl/7Fj6iAtkdfsv5/l4XWV0mwXeEw8zYfzVTMJg5sRgTh91E7nnWhXhYC9BzDzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
	b=ImkqvA4NTAjnXL52fIvKuV+I34UwWo3+jZb8oezK13RY6C5Hm0hcOSJGI1+oCjxqxb1t
	 R+4xh5jLzdODfEeSNYD5/+9g7ZwROiMRRFwKV2TFY6nvnNe/NQ6ZGTKt8Zb8sF8G7KOH0
	 KM2aReQIoVN3Znqj7EOb0cMg1JeRgsI25yU9fbJcYwZ6HB6ud9C6Bf7yEJKD6H83GNMhm
	 VPotx/h1LJvC0OH6sMjk4txDNONgzzlNnlNvkUVRBPOnYimXLePUSALJM+DQqHqNfzpK5
	 1HlEXpTWF9lWcnR6jYiE6Z9QxT2BhrdSs1E7ZBHoAtXWFNlbfhj8kmThy8mrX2b0tKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294F606A685
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3294F606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3089880f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577287; x=1796182087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=GAkKmFZeYJdeyxoFnkh9isZrU3i6UCbsZOVdLwfB4v2LQF1h8z+4rk+iqz59bQ64dn
         8zTxsCXgxfGgbE6Bwa6Y7qsBmv+4Dxzq8/S70qdc0R9PZ0Y2uaKHghNAaCKEOExHZJiU
         POquc91sPAnlzVRSxYnsxLtXJobZNE2Fh02SJSPUWOozFb+nfxqG1QU9tdbVbhxm5Uxw
         mLqebyiqt6urRpwsv1zLryw1YaoCw4UmB2EZVv+JOO1xupHyEOnxQ/kJpbBGb27Z31Fd
         TOHDGZpnaCOvqS3bf9g7fpTTOeuvmsjLnmLXGqVHyBSXvon0XYkCUiyGwjjRuScaP8op
         infA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577287; x=1796182087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=xj2CX4ntKiVGpiR68h97uHrDnLIn+hThzYGwLxOg739a8C7RPSvgMhxC0CGdonz0xc
         QiB78ZvJrSVlyIwi/AkGkx5lWPiGu/M8f5uCzQGMED8fUeNJmIrbghM0HtYY/mFCpKZM
         PrAv5gFVVqpqe18ypj36NSJpqKIfGNO1mbzJ5+BubeY05IJw3AFx7JQg2TRB6hY46RO0
         WEXNRcXh3B+tyBQCtaVfJpSKZv2os34ZhnQ/6V6Xi61nGCUcEFIsDKUVKGlxXVWDxtKs
         Ov8zZh61RP6lsKInJ0dSNICmd6Q92bjSXaRgyNApuLv8oBz2p8kR9E4PwmBBgYD4DgpG
         YYDw==
X-Forwarded-Encrypted: i=1; AL+hErFSpFrBUNZdWscYDwmYLy6XXTk1U432dabXCMgnKBBoGhDaMARm1yWvfbhTFBOz99OUThnOUt3ICha8Gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/K1Ltb8n8RKqGKHf92EbiaDbIiw5JK4TqESrrHP0t0gD/9mHkx
	Y2bSTUl31qZLpGHZefN6wSVlshd2GLYKqtvijDmfdDmGCN0enzOGAmom
X-Gm-Gg: AZFdTZfXUF7w5I2funhDYL/DA9bc78UNBOwbA68GSoQavqPunxDHZuB6iQO2bJZFoje
	UDLp5Q4Yu/qbmGr9iXYT317+9r6aCI06DZJMwOd4Z6l3xSTjU+9YJT6Zzs1cUKxgGgYSxDP+IXy
	53l1hcAV02v3pU1xZ3/M3gaiKRyEWiBAxnrcUAbSqslVmA8rAceoHzZeTnwoVCWQh6jFQcjposh
	cCS0YhrkjBZTfhk3+XBtLX8gvAXIfsNIGiVv709THL3fXl424G5MKg58S9Hf6ZjDbCc2AgbjSg1
	Ywy+vFhpKikIsISlSHDaUcRJ5GpGg4dnRj19U9NJrkFYVXrbeVWlo1E6eD47jE+Qqa/MEH7cTTC
	27Pt1VR25D4WDgh2BA3Ar0/dtICWFSb9SNPPAjlLMxVM+GsTMu2PapNNy0uanGDBhtBviFHe5jr
	QprvHQApINP0GJsVM1+3YRkjsMPa6XSWATBMHOPVRWYgD3uGqALnaEFCK3pBPXJUNkDAsZ19T5f
	sm9Lydwz2GVxVjyZpzjxmUpq6Ekb7TZxtUmGQOOkGnbBE8inX3oENaorQi05vodfwZVLtpZGVUT
	WF8u9jiLxSv1Z+Pd1XqviENPaypJ2aCWK0s2RZJTXTX2OCXTo+iaQ6SX926B2ymSm/S9m3ZvviO
	PhIYQdEEPypiVrRqM/Hu8qokIrz0snE4=
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr30278129f8f.2.1795577287400;
        Tue, 24 Nov 2026 19:28:07 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:06 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/6] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 25 Nov 2026 04:27:57 +0100
Message-Id: <20261125032802.8460-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5


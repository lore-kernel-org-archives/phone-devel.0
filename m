Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB6D306B06
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219169; cv=none; b=P4rymZAmnaLD8Wr1R9SkWXsg0C1XMLP743XGq9xjGEGWjnrlA7pxxwDylOsLzYGfyucI7RLyG8JLiLhz4xQw4hyrCG0uZC55ep+sDyQrYj/59ohGW5kN/Fmemo128tmU7YiJ2K8eBFVg9ROc0Sim3rlF1Jo4XD3q92be5D9ZY7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219169; c=relaxed/simple;
	bh=3vO33C4prgEUuBZnqq5YTa/P4+mnJCFLtkGeOswFDlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaRyyNF0SAg0wx8OGVNSCwriB5nJ6HEzh760Nm6lqBvHfd68G7m7sYezRMIL4svG3GEvUrERZHtZ170GZxen816rtjTovQf1rMcw/FXhKAl+ZJoEiUJMUQ3MDhSXyGQ9i56msQustBVvu2jwkWzG6rXatYTP4EwetufJWgJqLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4fktc6SY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4fktc6SY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso1214555a12.0
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219165; x=1761823965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qX6cAic9M14UMmPECgjQFR7mMda0Cr1cGqbVwyyhOK8=;
        b=4fktc6SYNOhO1951KVSv9Yyv1Slytq70Km0JZtnk8as3vXR7bV/VQB3ReVus+CrePe
         MnthU/NN58Qqpp4kMaoj5ViobTcFfo6YGo3g3Fq+3B2RIayduvJX1Ik6cn1pBS+p5Vnh
         ahOpaQa7VlQF8xsgCyUaUBWUqwy7ZziA29HP02vBr+Er+YjrYG/nOB/BbN4jBvpKjQX3
         mU2uoInOz9Q5fkQGH2V3rQ1UO6Ts49esCIHEJ9Fw8C2JV1BElU3kxE6KCGIaoHTJ3T0t
         TX/vEhqKJWQLLSzKigQgxqB+Ing0cQsqZ2t4Pd1XbgNxdHTBCLwz06ZA3tGJRksN1SKl
         xnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219165; x=1761823965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX6cAic9M14UMmPECgjQFR7mMda0Cr1cGqbVwyyhOK8=;
        b=SoLWrvsdpicr+0USlmnX7+HKgweO0FdreWemHbgrT6ePB/Mnq/26yhFB8Aq5ws9Ahw
         trmuPFULapK5US7mSiasT/UWnuPE2A8gimooMVq0xbQX2NW5w0HRmG7HxXmCfBaNKgZy
         pKM59NXmYZ7QQ5O2y1eSh9xG+X0DpHb/32sPEEeVokeYgHSHjbk17jYQioQJAIkvdis2
         cxOesWI6X/LHyA4ObzR4zXiLPLcv9rp3Qlh+WacSVKOwz51+HJ1chpEhdBnFtbqO3v/2
         KLMEhEM/IQXLtoaxgRqOuiXO+7ZLEW5sfrVnOmISsgF4XAiPsDuWWgxuDGQotVc+kyF7
         otTg==
X-Forwarded-Encrypted: i=1; AJvYcCUg2VdWW6SoOIdfhl4UDO26FBEyfj52pT/1ay2VoA1zRwTeSVXDnTK+LxEo+pZrLQPUOR3HcmqfWhCJvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykjueg6X8RW4Gsk3U3lQdV2ukY98ABuZnQQcHUmKl3SEloeLhe
	/Zk1pfrT40JAnkw2/9KzTXT0w5yLaD0kLZa4xeaLaHH6qEI+duWOkwSMLTYGXJuTBns=
X-Gm-Gg: ASbGncs/cDS7Psr13NT3M8ECZAKUzi37c37ErAsMqY1clMm2f5id8FlDrY8Yx8C6GyJ
	Eefz0WmgtL07qxtKaXHZB7OzQawEp0PNAcMK/4Jeu5SrkuyfWXR3rC6/u5ATMZqUXT+GcYAJXKX
	ylfCvI66j1dym1Cles0OT5u1jdRyhFZhWNK8qI+0FtbAStldt4k9JoqMVIMhsPA+AsokzYUklGY
	eA8SsYu14/ap9tvfOVxvbgGSIx4fNLK/g7nUwzppRigrLXOHzZJfS3m+3Hf0avUbxLYY9bi8+qN
	6ntwIt6+as44p+RMujpqI+ZEuNvhtRPvbPHhk/ufUYzFVwSS+t7/5trJKMywD6glJY/cn0z2gZh
	5ioc7xm3jnBe6Wuwrifh/+dSAzSejHYIMW9LvbWYT1Of/HcULNJEEkZigfkYtgXna416Nrh73ue
	EOT42Ysa2/eJNYVd/zZcHwFwY3Gp5gyeJES86/T8oXWObZzg==
X-Google-Smtp-Source: AGHT+IFeMmUZAb8+BZ7S/5mq8JGmfL733kMk+/2+3OfwZ4fzPVXJfBgAIEpqIhkY0LDxauZHEkWl1Q==
X-Received: by 2002:a17:907:d1d:b0:b3a:ecc1:7774 with SMTP id a640c23a62f3a-b64742414a1mr3091546566b.53.1761219165148;
        Thu, 23 Oct 2025 04:32:45 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:44 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:26 +0200
Subject: [PATCH v3 2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmxr2230-v3-2-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=796;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3vO33C4prgEUuBZnqq5YTa/P4+mnJCFLtkGeOswFDlk=;
 b=76fW4spLjf7RNyBrxeu194Jp/rr6uFxjDGE6H0VOOQxTM9LtGH9CG6F+pNst1snLtJ/a4iDDO
 IO3Be+jDDWXAFlx4KWtCm/znytapYUj60QEsAtNN3r1MEo2cnVwYPiX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PM7550 PMIC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..d0c54ed6df38 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,pm7250b
           - qcom,pm7550ba
           - qcom,pm7325
+          - qcom,pm7550
           - qcom,pm8004
           - qcom,pm8005
           - qcom,pm8009

-- 
2.51.1


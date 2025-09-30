Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89310304BB4
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240644; cv=none; b=Kjy26X3RlZQm/XwWJWD+Sr0PQPD1rXqAUmrTVbrYIlXuDGtEsLUybi7QEi6aoJTlu0CnYiiQnuV/ADzycr3tFiCZhfjoOdtbGm3mxtULlKJy/VXkC49cfb2CmPkr69fWBfRTnwbBYhjN7rN/6ZHAeM+M1zWPWQ6bMKO5iDBj33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240644; c=relaxed/simple;
	bh=VdrjHbZY8p6JBS2yBxBjZF8UPgGBrsrohOZQSKM2ILY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhDO1Py5uAemQszHLQFzmlqb3SYXNjNACR4UQ9WEisCC6RUG3zeO44Px/81P5ogfVjb0NkW/PEg9KfuwPks2Cf1dhopEhqLmoV9X08U1oBzjiwouNyA7AB0/RPMEcEWvB0K7aho6+a1CuIt6/XkCHT+/qWNgmAk41zM76SfR4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YnmsVLG1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YnmsVLG1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-634cdb5ed4bso7351600a12.2
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240639; x=1759845439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IhQc/KxHi+cDc2kNGR6DJ1hzrVsKnRbRYRWEuK1eFg=;
        b=YnmsVLG1GKEDlBWH3NHQeJz+1pBjCRM3cISRPIOJSAjbF6pNP+JuNQSoL+qXt2cQtU
         18vGO3YJDMeaWQDNsm5TkW2J7InP4yPF3RVyRWvFP90rlbxm+ZbW64opvTS+s9cKeL8d
         vOEVv2TtQ9whNkXzM940UHyIRJTO2bVzb/yolDtBRs9SF2vo8DFbcYKFpgmEkCnDoVvR
         eVAbzVCOD7arZ0pIB0QM/63Vx9PK6mYNxtf9BRXoYLP5nVQqR3b30OrRAjL7Km0VbpZv
         bX4h1Zuht6UOdNZG2pZMC40x6DksXizwIJp0QGUXFLZ958cmgqG+ZEa31n/4n1fURCzp
         wjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240639; x=1759845439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IhQc/KxHi+cDc2kNGR6DJ1hzrVsKnRbRYRWEuK1eFg=;
        b=kuVBeNqWiqI6dYCTypk44SOBLOAuu5uxX387ibbPhlPTZVmp/GKt8zh1GoZqp3fxGF
         sZnd1+ofTwcnZbqTAKHYWKS6OrIqttSwOu5mSrDViHRW2Xu2CfnGnXb9AqEa0FR4xQKu
         niAYwzYjynqVC4tbbLRkYJadPncbMdsYkIC5LNqoqg4++BcuWZVxL2GYzgl2yrk8x82m
         O5rVigBRG20EEmgHZlBlXuMFkPc8N+cBC9FnWlidpyonIh0PuawXdy60pOjwFQL03TfL
         a7iY6nXl4/Tmk3A/sFGBebptdgjFCvPXc3VJVDkX93DeQWz4xLYv0E/aNrimYTndrRs4
         uVRA==
X-Forwarded-Encrypted: i=1; AJvYcCV1n8c/Cf8Z6SXZShHw5gWNJKBxM25+nKPFhgNVy2FFspzVw9gw05h4VztD4kCWUroeCJgYPmJnWsVgSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9eqUQ0H07LnCsaPBc1MOAm088z5m5k/xKdOf22vy068+oH31
	oZ6QBn6JJpOarpuOijJ+UbL1NPq1kkuHoBx5+MpXqrskHE5Fy499c7mU4COEcQE0UAg=
X-Gm-Gg: ASbGncuWHeXyjje3KLUVXGd86dor/LZaOuj3MLMKzA4nEgJ9RKtz6RY4bNqb7c1+p1Y
	aA8yHbY+M2sSt+3U//ZveAeRTYwd/PGFnvylrhAsy17yJtm7dezEpKoDOeQOJ5fr8fLZHvYTqH2
	hge500/LGJoy38UjZ/GVxioY870OYW/fP72TB/7lrm14xYfEo5MNPsTFRC+qq9A584AZeDPssV2
	QjaMZ8WRhc7QY21bAKhq/4yZPsEA6lMwbn90okLOlphM/UfEWWPSWt6h3nDNEVe7WF2BlfQKJpj
	Den5tdilztqChBItwbGvxw4Q8S8dpsVB1bTPE3O63VjXjaAIgsHUfB31sQ+SqU8sTWZ8rC2Qc79
	eMCXCfefxa1mKkn9/7RFFGJIu8+adDRrafm1Tyjrdc2WhqUoSNjtrmhOhARNxNqV/2GeF6yLIsQ
	aeRGffS9DsCyb2ZVEtZg==
X-Google-Smtp-Source: AGHT+IFTx+BUtdYFfL6HuTb1lAb8kQTNr6zB4Xa+33+fIcOgSz29G8fLSpBMc7T/d9jfJ56OBR2HxQ==
X-Received: by 2002:a17:906:6a1b:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b3d73e1ef65mr951599166b.48.1759240639542;
        Tue, 30 Sep 2025 06:57:19 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:04 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: qcm6490-shift-otter: Use correct
 compatible for audiocc
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-4-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=869;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VdrjHbZY8p6JBS2yBxBjZF8UPgGBrsrohOZQSKM2ILY=;
 b=o0gnni3kPdNO8veSF1wAx3y60Q78M2zZesq5qeidQB8NNxrF5O/6nLJWVHRu7ouKyWaZEAPrV
 ory0fpzeVztCEIjjhL/6QuRUTbzUT9onXoQyRzZnEeVi2/Wb7hk6jyw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Use the correct compatible for this phone with standard Qualcomm
firmware and remove references to power-domains from a 'reserved' node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index eb8efba1b9dda422dd0295db2a52420a1a23d070..6be2ebb2958f5535666ddc3866d2eca9272abe59 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -568,6 +568,11 @@ &ipa {
 	status = "okay";
 };
 
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.51.0


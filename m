Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8222E1CD17
	for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708078258; cv=none; b=ABE4Dcc4ki02a+2SnfKveOfENpDWI6aTk6KlnpNvtCj2VX19sM7pCo8eDsMY/57Ro5CXAlRaOcOigkGtd7WsGU9Uar0Ivc8wVaLY1WRnVzLPTTJbtlB6FxynA9VOMn8+xeMAvMDsQTeMe62k6xzS6bN9czaP28YEZHVxJCJvDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708078258; c=relaxed/simple;
	bh=xpMb11dxg64nZ8TeWmw4wTspdBi2WW1ycVxNAeNDxxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngvKfPNkdTNeqQpYwXIwa/qtz0krlbxBz0DqxKkb7tuSToiNsTgnvQXWFAf5iHF8Xc/LcoINPlEIAIYZuIC2BrR30H2iCPvbFCWlKaCPTZFqSQYNP58lxOgjs3JZyXRpfsg9OS6rk+ZYA2fqBHYYm2rAGjMnBDs/FxvCX9p9JJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gbiXuLJc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gbiXuLJc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a271a28aeb4so72483866b.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1708078254; x=1708683054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=revdL7g1oAcERXcWT0jDr3geYXgL8Ugw/vEWapN0s+4=;
        b=gbiXuLJc3zpa100ANalakbCCHNufMPUpc6u668nXSfDTS9opCW24GtWw3DnhjW6/r2
         L9v2ue3nDChaQxrKKCtJxWNqZwLIKyFKjlved4YYPEdaaBrRnEtM5yAnCE9v720S96/p
         7z8kZx9iyxHp1/YBsEJfW4yoAkOUL7uDTi2ml4g3cBrLxE0lnvpOQp8NCRl0X/L/Pqgd
         bNUJJfuNuEMa4Wpd8SKKgCAGN20uHD+p2hOj5cmoxKunby1vYpxB5/SKHSmNsh0ClMWy
         yLFf+I6eLxqgIT4/l5ka5kk8AnWdKcvLUpllNwtX7wOoRV4pgs/AdVeVeEuewOTy5IUo
         d6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708078254; x=1708683054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=revdL7g1oAcERXcWT0jDr3geYXgL8Ugw/vEWapN0s+4=;
        b=RC54Nx9sRUZfzNc7tgIggj96MkGOyi4oY+iVUlwule2UyKnuWQXbspytX0dT6+LKxv
         CvgyW0hEAIvWYO/Pw8ZakVMNP+QtANrqOuvyQf7sStWxypTPQFtUaueG6xVXYGE9svR0
         wuSoCC3XYiYotOTGN+1TwtTBwhEaNydFk6VI2dQ4OJ6cxqufGzEFOfOcTtwsceU+ye56
         IY/pD7EJ8tIRT0tumT7sBl7PVqfXeYHFihIupmOOi2SK1StByagGrk6F1Eb3BJH7ezyO
         SlzfsW8ZENsdi6SfTTWwjN6wUTWwmlYx30eMCZhslvy3x57QvJ9k+Rj9Uc96+kWorND/
         0owA==
X-Forwarded-Encrypted: i=1; AJvYcCX3w6wNZc4Q4UePub4DxyFd6BaweJ03JcHvbfL3wapVeFJDJK50TLXDdGRU2X8hAkbRYdLq/W+Hvo/QmPbfK0grlfuIv/SqdYnWriA=
X-Gm-Message-State: AOJu0YxuhCwdMfL5C3Xbu0RMEGlCqw78w3Ts8BpqMi8ecrI1aTKfDgnC
	h2Mrt+Aax4xNHlJ7YwxfX37MuDvtEXNEOmZwgLJFpPk3iDE0vFYbPPPnCX0qAcE=
X-Google-Smtp-Source: AGHT+IHvVyi01m5WRubx/2LzMcgOYA+L1JCpSnOZwUbC6zufjujFQB6IyuxF+9dIEw7v0O3P2l7c/w==
X-Received: by 2002:a17:906:719b:b0:a3d:a773:b9be with SMTP id h27-20020a170906719b00b00a3da773b9bemr2526010ejk.76.1708078254638;
        Fri, 16 Feb 2024 02:10:54 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:10:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 11:10:50 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm6350: Remove "disabled" state
 of GMU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-fp4-panel-v3-3-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

The GMU won't probe without GPU being enabled, so we can remove the
disabled status so we don't have to explicitly enable the GMU in all the
devices that enable GPU.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 43cffe8e1247..5a05f14669be 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1439,8 +1439,6 @@ gmu: gmu@3d6a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
-			status = "disabled";
-
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.43.2


Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03523A1CE7
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804929; cv=none; b=m7icz9pwJNt7GjKArchQNvBhQsAW/kiPpJkX3M9yBsBFafZvfpKNmLktdMwDan14eN42AmB+4a6m1rIEBSawdvVEE/zAJGEWoUAhR7aMCniqASgava/c6dqQV0ZXQK32qbX7q0LLqkk2AYhGmK8AbuR2VKY+sQajMGVhuX9ISkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804929; c=relaxed/simple;
	bh=sh6CHOb16k/4gSZCp2k+BEa4Dkc0sI/mIZiIfX6yj8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7rr9xAsXarIdt1PAtmTAG+doOU5OuRtRAj6KakXZQZv1jFVPBGwSKSAv1tmfuB4U6UTDZMeHPdwkPz9YjqiJE4mFLTFxrf1ijApNxmeLUfCecpQnJGp/+RIRevRoWihj1vxmRPY9HYqXLA5JD5swCIJOO1dgNmCee4G0ZDlUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FL0TuqvY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FL0TuqvY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso4417817f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 05:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804925; x=1773409725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NLCQ6pVVPeDAMvh5rjRXQzwrKOPpCKjM6nme7d/FUk=;
        b=FL0TuqvYEQRCJVcnkV6MltEaP6XCq7evLzjYp7hV8teD9SN1p8WVarZcIunc6EdwfV
         oeYtCGnnquUkhrcvkkBEOK0t32Duh58cDneI8T8w+6Ht1mt2PqudsjSD/gT6ipIjPw2Q
         WzWCoRH51Ed/hPNLf3jqqhit+0/AzsLZ3ZRMd/1xfOPkDDTirhKQ/0f9g62KRbsksWQh
         xHR4vzk3T0jEdsIOfYqIfKdgx9l38Nenu+8uYdUtHPeOPPL2dO/YLm4YZyeOymzbMorx
         1vzZmYGRHDX/cQQwKKPqcUqDqUqr5Hb+1+scq8LIOOKPmXEbsQeJF8Fg7mH7Ql8plwJP
         ZGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804925; x=1773409725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NLCQ6pVVPeDAMvh5rjRXQzwrKOPpCKjM6nme7d/FUk=;
        b=XiKwV03aY36ysshuEmhaiHYj+Tw6drT7dWYFQoxMBK7sJgXVQeXrvLGwBmx76nnWm1
         eP56r/d98On9QaYNqn98XNni3IUchyEAq+grFDh5XYJntdFSaNqBA99ZGX1fBmh463Ap
         fLy27Vutb85mH8ARqpWi4I/mcYVkXPEBLRAc1xGIavJHP5J0q2BVpPYPr3ovmp88KYpp
         J2njepZE+lf5wUdXQ064ry9uYILjK8qUoODsHf6dHL2pKn5vyJNZp7GJyQVnUFkRyKM/
         r7Vy7Wsyk+JKinHolHljkf26rCCyTaPMRsk7htyVVXqCq2QSLJZcLkAaeT8cwglVfYXR
         YOJw==
X-Forwarded-Encrypted: i=1; AJvYcCWe43ZYkmBNm8f4/sRKAfycEXrrTGaEdcEcebvbyd117CCaJ4NoZOZLXuv/xkzeipwFP5GWef3sofgr5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXemxfN9szaS6et+BprHh7TB5dLPudAH7PfsUx1zTRJrOJLrO
	ipftmYO6HztfYqFNmsINqqCy0v3LhSZSmYLAvWwpJ+cs/8BFB4EGlnIyb93RzUo1ngQ=
X-Gm-Gg: ATEYQzxn3pAIMR+HxKa3R2AopLNKIYOU0RPjbgpJhl6uc9YDz0901E+4sghlE5/M3C8
	2L1ZO3C6GKl4OUuQy4GmXeu7043Zi+BATeK9YSdZZ8AWSgw6ppVeKLOF1RH8WhkWiUJCUfHKvHG
	8wvRGS3hfBCzULU5ULTvf2IEkbSydLijN6qrd9uF5oz0zdf2aPQAQ/cAGTgPx5SwNG0lJ9TvGas
	8iu3jXREp6uv3bkW19q99e2NSkhaPbGmHekcDb3LmwBIoeJEmgPSC1ER4CeVzUep6jy8cgBYmRP
	kmLxsziEfGYlYKkJGnZ6YzpUGsRKZ9i+pwKdx877yjVWSbL60WYZxOCrqc1yN8dhQlQDz1762GE
	EeHlg6acD6mOUQyJynAV+iCTp11F2LnQsvr4MhWXfKBcaEfxiE5uuriaNnrCAWq4d7cb5WfMp4P
	dXYEA+7vcJgQTfUF6+XtB5F8cx2oBxpT7W8ZfDdYU+ccbC2N5vbMRRls5KMeTji7qH1rJSrws81
	BGX
X-Received: by 2002:adf:f74c:0:b0:439:ddc0:4bee with SMTP id ffacd0b85a97d-439ddc04d31mr1328872f8f.16.1772804925037;
        Fri, 06 Mar 2026 05:48:45 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:39 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=942;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sh6CHOb16k/4gSZCp2k+BEa4Dkc0sI/mIZiIfX6yj8k=;
 b=Rwk6ksYDrCy/cThAXlHI6XclEqEjFdyZIsN3Mj2VOEbOOYEO9KGJX1gdo6C++nUkWEidEBRdB
 oQSI5ukXauxDMw/IUpmkGg7SRWOspAU7NUong4soUzWJeEfr7rjyWFF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the GX clock controller, which provides a power domain to
consumers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..621f05820826 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1224,6 +1224,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0


Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737352F4A15;
	Mon, 16 Feb 2026 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285146; cv=none; b=h7mQEHmbM3sGtor/6AOsqY3Xy3p8952irXpRQtPHxwBi6OAUug2f+SA+vebOam3M1MwcyWSamRnHaE9xGqRRFph/s5DRapKu7RuFceLhbR2Z4Nynkz2k+y3YWp+yOYVICm6Nu5UHWyJwy2ZOuBOFxgUYvBv9rpecibarGElX9I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285146; c=relaxed/simple;
	bh=RbCV6vzOlnwxtYtR5B5jbd9YeOD8iqu6VXuc+VtdXhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8gwvmilkdeKypwdXhPq7zoIBwlVWPBrIvBsG5AtaSGJEqZGodPE7jxqvEcDxuNI4mxE0B6I4u1+SNS0wBkGtfOUB5wZ+i2kMY7p5dML7o92F/iSpJpw8U+t2dPYmg/H06sY2qMgUoMgYuSKNWwju3taVuXNAYS1SwK4dabSK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=OXJx9inD; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="OXJx9inD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KY82BaUYIukxsPfbzUE86Y/IZ+XbH/uKCDnIMOz06rs=;
	b=OXJx9inDTjXp2JZwbkvCjcdcucOwNDeBErqq8EwU86/GBwbVAwNTyfoRATgdmwjf3UZFpU
	1cI/Lqa3LYdh6STnQoWQSXMX1mQo9J71ytvxEYKjyrkqs7iHRb4MmYgBKtoLJdxXsr9u1/
	rz6JUUoqZngpsgro5frg2b8KZfk/WubtTRHnUZj1rqiX9eGewn6V+92cAhWYS/EQ3sc563
	Fzz4nnak1rUiWvnCsPIqMihosvatamtAA0/GuFO3Xqjqipzjg+4rfQzlu0F1qFkJRd2Ab3
	dqZemXDgmt93pbgAhVv8WiyzTnu0g+q8oWJDyyurFNAyutdUdA/vvEWaWfN4mA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
Date: Mon, 16 Feb 2026 20:25:23 -0300
Message-ID: <20260216233600.13098-7-val@packett.cool>
In-Reply-To: <20260216233600.13098-2-val@packett.cool>
References: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

To make sure the display subsystem starts in a predictable state, we
need to reset it. Otherwise, unpredictable issues can happen, e.g.
on the motorola-guamp smartphone DSI would not transmit anything.

Wire up the reset to fix.

Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e9336adbc391..3a9a1ad8d581 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1864,6 +1864,8 @@ mdss: display-subsystem@5e00000 {
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.52.0


Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A62D780E
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285150; cv=none; b=dpYFVLmDC4Rz41ZPd9bfZMMETqSckAg8VIocYGGx3qTbumuSK87mUasr933LSF96Sj30a0/aC3KEG14jo1vjOjEVrxKY9bF28ILcV9kwunLlp/9/Jzh7JMg0K3J26M1iu+KufMPMnKjGktmRR6Z05xQI2BmtozmUQO7WjYfTTig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285150; c=relaxed/simple;
	bh=FzEDqe3HBmxO9tiERGUD5CbndWbXj8cTA4U4jJIIxwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJLf2dwdQrMEt1gAKys62LxEaoAL0rHN6LcB9t3dmYyzFF5WCLBwPN6tN/j0WQ/lYj/KWvL9Fgku3l895KE6F96b0XWTAJwVwzzpOloG0sp/AFA/EnX5nF2tdzq005WbI7hr8AhqzxftdQS44d4mMb7F+fwkbT3H6rJwjWGG+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=tMAJgSO1; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="tMAJgSO1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jw6LbuJdUl80cdrWG1FjVnPEOcj3kz8s/yDqaabuano=;
	b=tMAJgSO1aAwqoEJfxiKKa2h+P806coUwah+cWnqZSlnPnp4fiqAknqtSZJM+Kzkki/Iw7X
	jMX32IcQ/AvJ3VWI2mqFVrLAOwrnf2++7364cjpJorOIM5wjuhevrIlgsucEW8jUHUIIla
	VHo8oZkVtvsnwQ991NjE2feVAneOpNFGKr9qjCYPW2g80A1F+2pYaeXV/q/odVrKr5AKZp
	eiLfIaTCwr3aahD0sK3rY8huMfWyXhc1u6TlslMjmRbEFoJCp53A5TvmLBbaWDd2VHp5Ea
	BHdBXUn9d/A+ZCvPtQnvXm3GhKojxaTg1fq+/jPgZF0kj/IwubIySoQQi5tG7g==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Date: Mon, 16 Feb 2026 20:25:24 -0300
Message-ID: <20260216233600.13098-8-val@packett.cool>
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
need to reset it. On closely related SoC (sm6115) this has caused
DSI displays to not work.

Wire up the reset to fix.

Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 80c42dff5399..a22374e5a17f 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,6 +1238,8 @@ mdss: display-subsystem@5e00000 {
 				      "ahb",
 				      "core";
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			iommus = <&apps_smmu 0x400 0x0>;
@@ -1437,6 +1439,7 @@ dispcc: clock-controller@5f00000 {
 			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 		};
 
-- 
2.52.0


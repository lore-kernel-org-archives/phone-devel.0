Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF137E30B
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013368; cv=none; b=WVw7U8wYVJ1+Gy4jKzPZtUptSx4tmkfgINuVnJR6nRE8kYtsDoBS8az/gTgXXmQSLkzRHSt1by4+Z9taiC5osk8EW6lMgXBRW8VCnaeqcbn/0OLkT+faDdI3V1Hr8dW69ViA76BMpeQFOoK5BxNS1PgsHXk7pvmh40fQUP6sbHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013368; c=relaxed/simple;
	bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1mJF/RjiI7HBwX/LocX5ISrPHgMcf+0tFRSEnKaGrX+nN/TL6ojHHjpdhA+1EtYFDhTCihcv+3F/COBRwin0AbZGw0K7k3fSBBsL6/BaoEMpY8npfioqYxC2wDCUuAQqrPHwJHIwLoGsNYv6t7CjR1cvaf9Tt4kJp4wKFJQY/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=FPTvV8U3; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="FPTvV8U3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHq+H6MH4LbASJLjMcjCQqRRO4xEm/zZrOQ3FUn7dvc=;
	b=FPTvV8U3ZpZqVWYC/EkB2lOdLB06vtcxh26JBy8difrWCKL5h/PskH7B3kbiCoXqona2qN
	NiZkPSl6x+p7lSjM4L2ivsCptauUxeuaDuQCJty8iXR7ijdcUiqTUtO39vLMMJsBr46CB8
	HNx39/9agY18vFG4Xu/7KnXBTtWxvlBNq9WAAH2SwtbMcjUvSErQyIPF9RFA4j8vD1LMfq
	NSA12vsKcA3LCrvXZbSWVf4M3bSttT5hNHWwlZCITKLaqhTQelsr517zM6OQReMDqG/QYv
	5ynR2svZtJm5L7YfM/+SQ8KgPfXEOrxx5Q9t91Tb4Huw9GqiZnoPLk7vZnBaDA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:09 -0700
Subject: [PATCH v7 04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-4-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=563;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
 b=uBy5ltySP2XM1yUk3ThlsD1xsWmu3483jkdn4380d8QWgW4W5vSluT+Rc6qiqhjOHCWPLVMpo
 upqu3rku3NzAbV6VRm58JIItr2keN+WdFen6kbyeMoMm26Oj76iUjaq
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Qualcomm video en/de-coder

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 93ed8f240461..87ac41ec2e46 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -580,3 +580,7 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};

-- 
2.53.0


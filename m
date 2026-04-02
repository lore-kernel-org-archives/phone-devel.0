Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7302BF3F3
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112187; cv=none; b=ON1hF4JkxeI0p/UAPnopwzzmvrNp1VyfAJuM5t0Z2BHb3SyRLjMsQdDN+tF/GMr38QYxmLcoVsEKZJYwXW6YnXFiOPpUogVX2l5EAtk9uqZ1yITX7y2welJyG2d1fGgtA9vR+txuVIToHFGcX/1pa9ebBSRrJsWN1+0Z3zuAC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112187; c=relaxed/simple;
	bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oeDxVTIy2DQhH0GfyfytVFISGqpVkejpwAeRBkU+yL+YCkLumzvwdpjmUwf2ZT4p7qXjgezPD/VKsTTtdAaeqvOkn9wJkIbGtKpCHhbVJIQd9AXKzsfIYBg9Xv2mMqXRbHKouYtzi1AqZQYSknsL9CQ65NZjlyUHJiZs3JZ/OKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=aufk4sGa; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="aufk4sGa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775112172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vft3JoOWNIiyb6XKVwI3B9R+MjrgmBnquYhO1fWhg=;
	b=aufk4sGa1/VsfrFKVTKBD+bQAzhZHFOYjA7t1GCZxLgmfXb2NyQYvB+96qpG5c+y7MADPH
	mEyuEfFukJTE8wNLMLkoCkOdCRIurohecAAEsSYPTpRo58XHUXMNJfuIUdiMQ1TtQvdC40
	hHUwXdmfNWqnBU8qzX8qhxvMBtLokoj2P5sAEfZxd2T1FAvfyvLgM7RKGWFEW7hFpblw2k
	kABwl40Q/iIQ/G8Go8IzMAQXZlCPqSqO15SxwPcEdYyLInVJrtxmHEAcSeArxN2aLqRsn6
	qf5HbK3xs4CN/q8qtixs9LtS8qqAX8IG0/8d7/JZ0CeHFfjHUBZ390R1XZLBTw==
From: Paul Sajna <sajattack@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 14/15] arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self', add memory-region
Date: Wed,  1 Apr 2026 23:42:23 -0700
Message-ID: <20260401-judyln-dts-v8-14-cf13065e52ab@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
References: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775112052; l=1064; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=; b=uJaI33RqM0ctu6/j7WPj0hxJcGzIrcqKZvf9w1DDWFEpH6UPF+d8i+JWHZpuq5g4qpwUaYwl1 zlkiXrGBgbVCq1flq6qdFBuIqp7X9z2DLb2n/BCCbPPNgKVjoE6rWwQ
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The modem firmware for this device doesn't preload the IPA firmware
and requires the OS handles that instead. Set qcom,gsi-loader = "self"
to reflect that.

Ensure the ipa uses the correct memory.

ipa 1e40000.ipa: channel 4 limited to 256 TREs
ipa 1e40000.ipa: IPA driver initialized
ipa 1e40000.ipa: received modem starting event
ipa 1e40000.ipa: received modem running event

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 9d82961d527e..85dc4468b6c4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -473,7 +473,9 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "modem";
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 

-- 
2.53.0


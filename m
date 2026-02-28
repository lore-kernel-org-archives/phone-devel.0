Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8EE239E80
	for <phone-devel@vger.kernel.org>; Sat, 28 Feb 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311639; cv=none; b=qYTqT8+9qctda/EOH5+LMB66dhlR/jkwAwjh3tnrORywCzP5MUUNR7camBbMNIiQ+nD4cwjQvztT+6/Ynw3hngGgDKyCUelnvfWFqmxaUjr1HJqHB2U7OSEiKL47CMRV9rtmzMiqOrUHHM6XsYMIclDQJT0Tu90bFvHj8+I6144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311639; c=relaxed/simple;
	bh=wpilwaKapWp43wsjfCFYHhbY0oyQXChRrcmHY3NSCQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m064lfFbFdcH0KLv3Hhg0SaO4SC28dFTKD98BeCdLaHveuVIy4OHyruPwOmTnpk8RSqmffpcqSaXpue/TmGEQ9FQQIHXcTxDCML/AjY9axxdJ8j0IRHd/rXRx0yuYZf7GB8Slfl32poMSYqbrY8l4vTPa9N5MjV9fM4fnGulLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WwsxoxIG; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WwsxoxIG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JY8ah5sntkqwYsnjRryTUayuLGKdO7gmIkWN0EIBh8Q=;
	b=WwsxoxIGhM4p6ubmxG95hoOAI1yTdJ49aE2SpnU7ZKX21oAS0H5KAgbS+qCvxef4z/iA1R
	513TQ7qSVX5Rrch06cm0vP84t41yIMNTsZ+aCsTe7zzdJVAkgl3L5nIUk4RrkyEFAjlYPc
	uTDev8DLe7Qen9D2XauFK2sHlAYZBmbpDKckGe3FWL3SLcmPIAuvRiGyC/whRRSysKGJUD
	NmTq9GIl4PdzBTyt2REJawNtNm8+rJ+izDYrUy/oPdP0qNKy2hqNDr1O+dDkSGWaXRMl6x
	jiC8Yh3XBmsbgLB/jsLxZOmAcmbftSiAqYp7LsA7eAvlmxVtcpwOR4m2TGLQ8A==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] SM6115/SM6125 MDSS core reset
Date: Sat, 28 Feb 2026 17:41:26 -0300
Message-ID: <20260228204638.11705-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

v2: Collect R-b/T-b, expand commit messages to describe the issue everywhere
v1: https://lore.kernel.org/all/20260216233600.13098-2-val@packett.cool/

Val Packett (6):
  dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
  dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
  clk: qcom: dispcc-sm6115: Add missing MDSS resets
  clk: qcom: dispcc-sm6125: Add missing MDSS resets
  arm64: dts: qcom: sm6115: Add missing MDSS core reset
  arm64: dts: qcom: sm6125: Add missing MDSS core reset

 arch/arm64/boot/dts/qcom/sm6115.dtsi           | 2 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi           | 3 +++
 drivers/clk/qcom/dispcc-sm6115.c               | 7 +++++++
 drivers/clk/qcom/dispcc-sm6125.c               | 7 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
 include/dt-bindings/clock/qcom,sm6115-dispcc.h | 7 +++++--
 6 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.52.0


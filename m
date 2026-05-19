Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662564AA4;
	Tue, 19 May 2026 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160613; cv=none; b=GDRUAJNXfLLrgwiHFDRck8Zv+1CE+V0rIVqsbSWmH9WtOtI6YaXKuX2zk/qfYz1m5GwnZhCmvBtQIqBRnRU0GC13a9ik4uawGWaLfdcO2AcolrQgLfrmInV/7+d6pVpNEbHdQz7uwbJk0/JADdSa3CbbQcsqLmue9pPNYGau0Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160613; c=relaxed/simple;
	bh=kjzpGyx0PBTX/SWdjfZxD3Pyq1f4C0eJRCtxXdqRTBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SyV43kjFi8cCNacHohHnBk+u1LDZsXO7CfA01gtWkMMb/wTvD1vbbc5LrvDVqvsiMNADCkLJIZlD7zcdl1Lo6zHg4YtqIEfwX8xLUb6/nz+aBJkYq7YJNb2FIEgWQSF6A9OT57pKLypoxYjNLTwu9Wvg3CbprzPu6rAM84a8kRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzH1s4CR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzH1s4CR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE26C2BCB7;
	Tue, 19 May 2026 03:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160613;
	bh=kjzpGyx0PBTX/SWdjfZxD3Pyq1f4C0eJRCtxXdqRTBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzH1s4CRBT6FA5gr+4lSIjxQzUAPwQnMLTRXC+GhF6tQhFBeS/5pHpdSbSdSOVrfz
	 ZZPF1M0+sOhzSkZLec/cgWBN0yelaZAyndYmeGaU+cqStYVTw5W0K+27irq2o2reEH
	 tZo4tPBtL+wKwUR+ZbNN8q2CsCMeBovj7vPneoe508Vo90bIXGlmrj626yR9w12wMZ
	 pDOxCa978fztTCJeyxlRlfFArqEB3gik8mDJjwPU6LAk7/Q/6/m2oyM1ZzUNs/RMd1
	 S2qyaVcCw9DrkH98zXV6ykEwSRcf5X+dNeVkt7TGa1nPOn0vKmEe7AFoKySnxzl5Fu
	 01A3V5VSsVS2w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT properly
Date: Mon, 18 May 2026 22:16:44 -0500
Message-ID: <177916060474.2063946.2714698992906634506.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Apr 2026 13:56:08 +0200, David Heidelberg wrote:
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT properly
      commit: 487c97b671e4f224adb9d74b9f14372e283bea32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

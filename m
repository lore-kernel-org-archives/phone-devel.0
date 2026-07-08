Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A74941CB27;
	Wed,  8 Jul 2026 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522664; cv=none; b=ojevwkSIKLK+pCNuukz6lY10EdoB6sYQRudF5C5i7Q0pdp5DJmvSkO6aBEOLx5Py35kk17Jumx6+lM45xtgHsuJmI18Tr+Turf9dfWLi5Ek4SZP3WjDQ9nF0AlfinYZZkqF8ouL2aZWA0Y+WHZv6z/CShetEykwjUdFTL2f9OCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522664; c=relaxed/simple;
	bh=pa/ka3/BPiK6nsw6ZLpWmMXaUueZpiGpR/uMFDEhMsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQyHw3SOfI8eKRD5nCY/CedoG53D+RW95mM7xDxm6aDOOHVdm495WOtGNZ22yu17ixXiWIR1P5DOgdqvq3WvWNUFEySTIFbRk4G9Wxtwt+KH/igU/LNUzn4tgo2qxbv+CdEw99BdVxu/fQr+CVtHJHSNzP34STFS6cJZ3xwZhas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDE3CxpJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDE3CxpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AB51F000E9;
	Wed,  8 Jul 2026 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522662;
	bh=v0opnxlO504CL3XbPm6kAQCL9w7jEyZIfhIylJT3G/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NDE3CxpJK0i0pMTCYfwbzfipGXqgid0+9ilKo1GAJBZ3BDABjG+O9iAHJV7bIBz7K
	 D8aTwsfnKchyaynsM+Df1xkHy9ll544A9wnl0J3wrwjnyA1mCsHMsophG0ZeZEqCNQ
	 SUqO3icZ0AHse5sUfyvokO5mwUsEer87i1A0fSq5OlRuOSxMYTb/1TIgx8aq7hZHyh
	 2qUQV3DTjKcA62V7VZziVqcfg387a+NPwTmwX5kdG+zcHhfkTrZV0kKMGhmP122gO4
	 +xduXMo3Wnx+h0+rtrOuvgdxqXkBuIVV1TWfpdQtlHXtH3h0ribwyXII9q404O5UOA
	 NxYCxKxj8tpGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261 amplifiers
Date: Wed,  8 Jul 2026 09:56:43 -0500
Message-ID: <178352261619.2235436.4886841647250591529.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
References: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 12 Jun 2026 14:52:43 +0200, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261 amplifiers
      commit: 83f13e07c5216058ccf53bfe08dd5c57e28e747a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

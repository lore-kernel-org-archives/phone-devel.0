Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564612D781E;
	Thu, 19 Mar 2026 03:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891101; cv=none; b=VzXDjVnGFOksHQeJ5PojQXtqCqGx3lRUigvfAYaEQpsehLnU74IQvN8W8SKeVksT+Nb1wrNzoi0cCQiNLF6wJmMgaIO9Hp4c98l0qNkkLam5NyCbAa73khyAtCPoABJdBvYGmdXs7QO9wV5MAZQ05MD4ZsVMYfnrKVrXm4YnbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891101; c=relaxed/simple;
	bh=H6I5iUhu8WEwyl4RUJBiWSwYRh7/RzqkKvsbi7zUy8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQxTn5o9w2xM/QMdFocOszrD3um+nBtpHwO4Mt2N6TSmm9JiUFs5B0vucRMxIUS3P93G+eXP9Gh+HI4G0d0T5SOFAN6DmeItpzL2EBxgHfMuv1nq0oJqZMuWeZNJCWJMIhJyGmc0kg9n/Ppi8bNanh1FfR4TT9fVOZQU2Idy0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifW2hx+U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifW2hx+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6DCC19421;
	Thu, 19 Mar 2026 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891099;
	bh=H6I5iUhu8WEwyl4RUJBiWSwYRh7/RzqkKvsbi7zUy8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifW2hx+U8NaZJcLLbX94ufGr0m5tNIS4xaSo15GqB7GYyCmMMPo5Nhkox3UrfIMJs
	 TKxDubfXS03QeOeRNiSXdC78juO1gCeHVENN0CyYcfGojX7vPGlgMCUkxKLtfeFkA/
	 kwi6+H+LaatPZXYEKLRxeI+nRJrBeJ6C++ToO+6YJP0DDolJBZr1KgVeFHPX+8GTcG
	 CR4evGHMc22/NKwKxk8chBLBwaNDs4c4VaYLU/UTgMu6ps4m/vDNe+JVVZUBO7R5Vh
	 +lZG3cO4b0Aab2Aw7M1OKrZx0OaQMF5XRtaiOuXno4azjq4kXJL7kIkDiBaa/RuVUS
	 gIefoKU1FZAHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <AKoskovich@pm.me>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Wed, 18 Mar 2026 22:31:17 -0500
Message-ID: <177389107881.16612.7570963903012308144.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 16 Jan 2026 15:50:46 +0100, Luca Weiss wrote:
> Add the required bits to enable Bluetooth and WiFi on the Milos
> SoC-based Fairphone (Gen. 6) smartphone.
> 
> 

Applied, thanks!

[1/5] soc: qcom: pd-mapper: Add Milos compatible
      commit: 678647c26e317d8d1de4d630ee9ffa7ecad637fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C0356A24;
	Mon, 23 Feb 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842587; cv=none; b=CpERdz8F6PbtroRXrH6lEURt3UoHIKmFyHo5p2n0MCRA0IYtv32WQYNRQ/C4bXU0sWv7rQsD1OKmKKnHJg2mpObpTrcL1nxOw76bCdfm28RxWeyITpxQ4gQAm2NhjBSVlybbPD2pHw3J7eKLKH60fUG+w8iWeXYzLlR/XHuX/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842587; c=relaxed/simple;
	bh=sQDGB/4LD2boeOhifdS5IUoT7OL0r0nYxmEKNWhR7Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAgA3+5oV7fVN+9JFLV/N5u7mhGs6Vm1JRHbXnOzPAiatOCp4d+NOPCNCx6tUp09cf/YQtuMuGyG3SnIVYeWqlNxd3OWODIyH9ac2dnBtqCJWxMsv6wD89UDhp9dQfdn8k2cK/buCZLbuchsZ4GTXL47oMW1pozzZXB912umA10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrXdCkhE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrXdCkhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7545C116C6;
	Mon, 23 Feb 2026 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771842587;
	bh=sQDGB/4LD2boeOhifdS5IUoT7OL0r0nYxmEKNWhR7Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrXdCkhE1OVhRfgfDyGPA21qceycMfVvyWt+16Xe/5ztc9LsaOJuwJzOHU8UV8gw8
	 lLWCFMP7D89HVN68avNhwHzotsfLct81kOBWhFH6fKUD/SbPgSvb7HokHrfsMIv+5y
	 yDrR1O6y9CyMkZAIIcvfin9nBDoPEq37MH/wtBZEJdjdYmt22TN95gQr2YB6gLHXlJ
	 Cy05WZP69Cr7uHS5DH/VEO/Cws0PUkD3Ff6T2VHL7bOB+cpJcOG4lCribpugkml0q/
	 DCt+tJdEYS/7vnzb09wubcGOmSijIJ5u9YrFOY5546rC6X2EFri0pAy1ncbXmyRBzo
	 dT8jKjmmvBxVw==
Date: Mon, 23 Feb 2026 11:29:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: qcom: add wiko,chuppito
 compatible string
Message-ID: <20260223-victorious-nickel-nightingale-e1dea8@quoll>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-2-6336b1b12389@posteo.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260221-wiko-chuppito-v2-2-6336b1b12389@posteo.de>

On Sat, Feb 21, 2026 at 09:55:40PM +0100, Paul Adam wrote:
> Add a compatible for Wiko PULP 4G

", a some sort of a device... here goes short explanation".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


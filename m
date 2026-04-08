Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6D29992A;
	Wed,  8 Apr 2026 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633655; cv=none; b=o1DylY+CdC3/u1Wcc5Y6W8WZ1ZYGpqRK/CacFUGYbtrHwq5JHaZv02zVazz05230bjvlKM0H8qS2lOPXvtgUvuvPv1WC92keFzriU89hX1oDWzPjUkRk+R+fxwzn7SCIc4cIXyDvtWun7A5gj9BZaVYgsWfV4hlLATacP/08qT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633655; c=relaxed/simple;
	bh=K8VQQAEs/eo7F8+ORe5GNEGiddGHOc5ywuUBSUsa9Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM20Tgme5IEVR/p7IN0uWKG/W/pWBESIChs+TXbQrF28HpK3F/2dbYg0z7dURKTJlDUqHhHbMidSUdLRaLREvRtlgwlUl/2zlUIddQjAdWqlnoM1wukB5Naa7qo91YLsE2xgla/Lp8Dn2Z7mwFslc15aMQzaaHR4WTYcquumbtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/n00m2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/n00m2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F92C19424;
	Wed,  8 Apr 2026 07:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633655;
	bh=K8VQQAEs/eo7F8+ORe5GNEGiddGHOc5ywuUBSUsa9Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/n00m2B6yubB5hcRTFJKne5VIaMKKcnkWV9D05KIfUctDHB+UcY09kckiHpW+gXa
	 HcEVCpm+ZCG4r1HreaBb8am1+r70HdvBWmkWlMDPw0dgq+rwyAiFMyNxhyAndtDNz3
	 tSDqSaNont2vsc33XWaKZJDuIVO6Ka6trVK71eUw7BFvyy/g9fvB4lUXKp1iBd2HNw
	 ZtIEFXrXafhm6Xy68o8ae/iIs7fWD017QpuG9TMF+RJ1n3JaO0w6C7NbsL9KAHLVcp
	 GaepV1uvyA3YqGUq7VbLbPKSIuS2IeO5OFgzeOH3sWsCfgLL3CJLlfRafwYLeA2tRe
	 FrugsrKHb5qxQ==
Date: Wed, 8 Apr 2026 09:34:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
Message-ID: <20260408-adamant-hairy-galago-61deed@quoll>
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>

On Tue, Apr 07, 2026 at 05:11:11PM +0200, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Not happy about the names of the subnodes. pil-reloc-sram is not allowed
> it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?
> 
> Please advice.
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..0c69d5810f5e 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,26 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "mmio-sram";
> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +			ranges = <0 0 0x14680000 0x2c000>;

Use hex here as well.

Best regards,
Krzysztof


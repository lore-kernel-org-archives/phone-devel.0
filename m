Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB533282F21;
	Sun,  5 Apr 2026 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775376158; cv=none; b=EsyqM5+2MwIkH5VSlnQc7KpaXdqHoYnO+RJFhq+PRrwClCPlbfA09ijL/xZ4dTwYGjYmcOYIUbVyokUuUIxlxIyKBt/e1UWTibqCYuWABabbk3ZkdB33+ttompYYPF3QaJtkGtul3TjCGCMrtgL0baoSbsOXY2V6ojWeKlpYpPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775376158; c=relaxed/simple;
	bh=5ik/lkzu8Uquw/F1gj7taFfU7h1lTj1wgJDF3o+dWYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4n34eujGQ+kgGYhnbyiF6qJqg/gPCT5Zc2cFJwCxdozFoTCtLdCPwfVCDyMm6dh/9P/2mzE45V5fHnkbVj6ApshwhQcAkLAjQS2VcVxxOWh+CzXBxjAWkvFCjI0DBlwtKI224MZU321ay8ohlE2tFA782Hsq11sMcWc2kDVpvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=US0WMgMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="US0WMgMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09BCC116C6;
	Sun,  5 Apr 2026 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775376158;
	bh=5ik/lkzu8Uquw/F1gj7taFfU7h1lTj1wgJDF3o+dWYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=US0WMgMStRZmWs70GSZtxmw7slxwywKPklZ8DgCuUBi9Pi9QtE59qxGFXdXmHu8Dj
	 ZcsOSR0WlOk3TNXQoY/V63E+nlxU5w8bDy7v8r7kxCyn4f+AUvfahKOVusV+d4rt7U
	 ijfch9XIM5pD9YkWAZ63aikzhBfkrd7X3ZYnj48/TFG7qBaNBCDc4Au+TpgJ9v+m+V
	 xSBHrwWuj8XZK7QYX198R0AB6kMEvI1YOY8imrwPhrS13TF0/LeXqV3IBZoaKFi8ll
	 RArNNaRcNPT7HkA8RpPDaZwQcK4CJiuzgKECyExpIC6bLcE0A5JNugjma7nxZidYwW
	 bksl054IBafmA==
Date: Sun, 5 Apr 2026 10:02:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Jens Reidel <adrian@travitia.xyz>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Fix
 compatible strings
Message-ID: <20260405-tidy-dancing-albatross-1b1cf4@quoll>
References: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
 <20260403-beryllium-compat-string-v1-2-0a6b9cb55a20@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-beryllium-compat-string-v1-2-0a6b9cb55a20@ixit.cz>

On Fri, Apr 03, 2026 at 06:55:34PM +0200, David Heidelberg wrote:
> From: Jens Reidel <adrian@travitia.xyz>
> 
> The most specific strings should come first (panel variant included),
> then the more generic ones (device and SoC).
> 
> This is necessary for hexagonrpcd to guess the HexagonFS path for the
> device. It tries all of the compatible entries, but if none for
> xiaomi,beryllium existed it wouldn't be able to guess it.
> 
> Fixes: bcf429831ecb ("arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce Xiaomi Poco F1 EBBG variant")
> Fixes: dd6459a0890a ("arm64: dts: qcom: split beryllium dts into common dtsi and tianma dts")
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> index 2d6f0e382a6cb..d157622f84d13 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> @@ -6,7 +6,7 @@
>  
>  / {
>  	model = "Xiaomi Pocophone F1 (EBBG)";
> -	compatible = "xiaomi,beryllium-ebbg", "qcom,sdm845";
> +	compatible = "xiaomi,beryllium-ebbg", "xiaomi,beryllium", "qcom,sdm845";

So now for all users of this ABI, the ebbg variant will be treated like
it was Tianma. Your commit msg should try to explain the impact of this,
beside the hexagonrpcd.

Technically this is ABI change.

Best regards,
Krzysztof


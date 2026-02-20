Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA73313E1B
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578905; cv=none; b=jBqH3JtYgFgPwlConURAAxhOCnd2lRcVU3m661A7LyDANcRetOlrT1cbKQp+olvPt/iWLWz4bHz5v+1YTP5LwufdQmwx+qLoiJTHQC5K8loxywAzq+BGAahu80Db0j+q1aJtGPSBwFvV/4OFxBX+DfIbxszb93K5d6FsJxRi9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578905; c=relaxed/simple;
	bh=lQSuTI6NDzkLpVlnQeG5rhcxvGLMWNk3s2GOuv6JGvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeY3gsxF1HTJVYnb8AmU4skLKggchYAJh5mg/LvKQIrqAtLSdk514B6pD9RXbzrdrMpIkY5rGfAM36FJQqOmykWxMjA1e8pU9KeGsoViH18G0+qPzOJA1kJtRVsiuahn9OiguN/Z1D4pWBLRC8efdxnVyRUYHquPgaXe28KwesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWN7953g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWN7953g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904FFC116C6;
	Fri, 20 Feb 2026 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771578905;
	bh=lQSuTI6NDzkLpVlnQeG5rhcxvGLMWNk3s2GOuv6JGvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWN7953gBj+/npzs98bhE0F8vDfIk4PiNfo6Jv28np49CYOsQerbJh0sStLj0DW/c
	 F39OcDOks2vXGlhecqmlL3TcZvHvOiNB2G9DDC9kxrsH8fp66PqyqQCWo4kP3WKUVN
	 bB5U7RpbGamo/ZnNNdLGLLqh4vlcZPwiu7PUpXYIBfq6BxBHsCcdlxfEdy3fsqKzFd
	 GNbiNh6JjVQtofwY1OJW9Was6G4D9qU+Xzxvulshy789Rhc4Tf6mpLXAyqtbQlCki2
	 4HsvlA2oYTPpojorLSeD6NJ8hJj3hD03Ccm3YQUB2/Sp3+hUrBYOAfY48lTegrpQw7
	 RTbYT350PWa7w==
Date: Fri, 20 Feb 2026 14:44:57 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: u-boot-qcom@groups.io, u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Day <me@samcday.com>, Sughosh Ganu <sughosh.ganu@arm.com>,
	George Chan <gchan9527@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] mach-snapdragon: allocate memory for DT overlays
Message-ID: <aZgmEeOl0P4RmhUW@sumit-xelite>
References: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>

On Tue, Feb 17, 2026 at 08:51:34AM +0000, Antony Kurniawan Soemardi wrote:
> Allocate a 1 MiB LMB region for fdtoverlay_addr_r when
> CONFIG_OF_LIBFDT_OVERLAY is enabled, allowing runtime application of
> DT overlays on Snapdragon platforms.
> 
> This is useful for Android-based boot flows where the final DT passed
> to the kernel must contain modified /firmware/android/fstab entries.
> One use case is redirecting system and vendor partitions to microSD
> storage instead of internal eMMC without rebuilding the base DTB.
> 
> The allocation is conditional on CONFIG_OF_LIBFDT_OVERLAY and has no
> effect on boards that do not enable overlay support.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/mach-snapdragon/board.c | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
> index 5fb3240acc5a6dd23d93515029a596b5f77ebfa3..829a0109ac7807d692e127178f76d8822d5da5e2 100644
> --- a/arch/arm/mach-snapdragon/board.c
> +++ b/arch/arm/mach-snapdragon/board.c
> @@ -555,6 +555,11 @@ int board_late_init(void)
>  	fdt_status |= !lmb_alloc(SZ_2M, &addr) ?
>  		env_set_hex("fdt_addr_r", addr) : 1;
>  
> +	if (IS_ENABLED(CONFIG_OF_LIBFDT_OVERLAY)) {
> +		status |= !lmb_alloc(SZ_1M, &addr) ?
> +			env_set_hex("fdtoverlay_addr_r", addr) : 1;
> +	}
> +
>  	if (status || fdt_status)
>  		log_warning("%s: Failed to set run time variables\n", __func__);
>  
> 
> ---
> base-commit: f9ffeec4bdcf1da655a0ffea482062adde78fee8
> change-id: 20260215-qcom-fdt-overlay-ec6b8d9d2a1b
> 
> Best regards,
> --
> Antony Kurniawan Soemardi <linux@smankusors.com>
> 

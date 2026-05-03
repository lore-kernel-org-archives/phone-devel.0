Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF5346AD4;
	Sun,  3 May 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811319; cv=none; b=QSA0ZyGy7bbC/++i9F4IRMiAxOA2EueeRV+GeKgg0SV2oSenS+01nXueT6J+mHFItcjhxKICoryHXU7bStw8Sjk2AGrW40KrUEeCY+hmjUvMMo7ho/JXXFffQNxWTNYhOu9X5lRz/C7a86K6kuM8zETMXvHtwzp+AhBFlq7qnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811319; c=relaxed/simple;
	bh=XtoxY7F7drKLhqW/BysRjAd6l6jCIyfrkg3zJNE1UDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjl5y0OX+46CY9IymOXHoMP49LHEr5yMFHE3SMhxJ9ymxtNQN1hHQLmcrC+DwlOePHg/qpQwntjlfnqh53+l73WMsbYBuqzeu4eCecTSPCuj/M17rim9Y91eO8pxVbupHEcJAKBUYeSSbHXjvi79AWf3JQpIwQiSamfcwCCZBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMIGUTiT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMIGUTiT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CD4C2BCB4;
	Sun,  3 May 2026 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811318;
	bh=XtoxY7F7drKLhqW/BysRjAd6l6jCIyfrkg3zJNE1UDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMIGUTiT+pI3yKKnqP8fl9NpK6Xyd7zShKBlPCB2cb97zRrPP6HHnGTZKRmF2lq7b
	 IAPLP+ZqfRnYPh4sRxX1G0QgA40khFSCvaWWRJ/s2SsUbjWZX3ROXn/dH7iDBAfUAg
	 qFW103nqNgc/tAwa3YckHVEhcmf4bna/xCZYQBphh4JKEl94uz2zCHoV+lWjOcuKMy
	 slKCTxOzXXOcIq4Sp+xgLZqjcOPBjiFJfxQfY6Xb49icOr4ictuEKwNX5mXpx5Ms/m
	 gNQFhBabp0rxGK1TbDXDYN2br08XneR+zfIoWxeFDw/xgp4nlHTQupXHiYreuslp/M
	 O/y8AwcseAdrA==
Date: Sun, 3 May 2026 14:28:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Marek <jonathan@marek.ca>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alexander Koskovich <akoskovich@pm.me>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
Message-ID: <20260503-crazy-macho-starling-be7a1a@quoll>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
 <20260501-milos-mdss-v3-4-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-milos-mdss-v3-4-58bfc58c0e13@fairphone.com>

On Fri, May 01, 2026 at 09:14:46AM +0200, Luca Weiss wrote:
> Document the Mobile Display Subsystem (MDSS) on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/msm/qcom,milos-mdss.yaml      | 286 +++++++++++++++++++++
>  1 file changed, 286 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


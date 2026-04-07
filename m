Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7824DCF9;
	Tue,  7 Apr 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588795; cv=none; b=BXMVlqnAuCjxHvwDcCs4LDDc2COzjTJOnQmTOnkwqvJq9d/S4ovkSiewz9RsUbBE56i3blnIK6cfUcjlQdXkc12ZJ3PVKEvX1hBFk+lkYrrCCm1gSFU7WiWT9OdJlNEDKPZ64Xn2yhfjfY6kVe5oSeFyQizfhjAZsvhdTpcAmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588795; c=relaxed/simple;
	bh=Hq+IOJYCkw4JbDC+bBwSEX/CPKTrUlWLzyB1XTjz5/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFPBfJq/VgNzl5jPExFeyWpQEDAfpmIM2BEflGCsR6KRjm785pOJWyupnoLguD+ZXtcOjm2Ndy8GXjPLNQxj0aw5M4iVHPOqyfk3xCgsHfvc+kdu8SB5d0T0eliJAvB1VcsthQFW0zGuktPaX92CrEzPTxxo2WuK97b8LJLVGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpOJ6YjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpOJ6YjX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0D3C116C6;
	Tue,  7 Apr 2026 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588795;
	bh=Hq+IOJYCkw4JbDC+bBwSEX/CPKTrUlWLzyB1XTjz5/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpOJ6YjXaLtR+iTm+8cOI4bsFzeo8smYwnwD2pj7kfNh0tHoLxj4W8ivd2+zIXSOi
	 A1zXkd+RGA6Dl/zX3/+qsDaR7jEJO3mR0AxWETVz27E9mXPunsVMVmae8r0oleaDr7
	 3KXwEH0YZHr/Z4egZN1eqjae9GS8z0m862fYLLSPH/GrPdtco6U2NZfJM6B8Pv5jrK
	 SVzHrF+73zJzStcdFSrPdDnCSYGeqAfQxWYNxgHL/3Q8azyiu5Av54mVL5VqELmAvU
	 gYckmrSLjTi6aQvV6Cv/ABWuiNsiLO+ZVQbm+BvMjQbnl/1/kQBfUFK0cvLpHhYCTO
	 B8uPj0G0WapLw==
Date: Tue, 7 Apr 2026 14:06:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	phone-devel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH v2 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Message-ID: <177558879261.3407888.5748390211797594500.robh@kernel.org>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-2-bc586683f5ca@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-milos-mdss-v2-2-bc586683f5ca@fairphone.com>


On Fri, 27 Mar 2026 17:12:21 +0100, Luca Weiss wrote:
> Document the DSI Controller on the Milos Platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


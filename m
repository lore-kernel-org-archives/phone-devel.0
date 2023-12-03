Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786D439E;
	Sun,  3 Dec 2023 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7aICsSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DA1C433C9;
	Sun,  3 Dec 2023 04:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701578267;
	bh=efSYakHRaNQ1HmzcXaErAE3GqG/WjaPldXZV31BdrcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7aICsSMqliUYyoJB0YbhECQt/0vJdaUvo4Gw9DoqvJfMURFazIoPSSH7pylHfmgM
	 igKRHYrW8qbRMylp5GSXv6s1KT6BcqyAMEASBqU8Dph5uRuMBvX7kTlQxqNAIa3atB
	 vUAnUzCjdXgiadkOIcehCupDZ0J/rz8Ws+NvyGr05Cxjo62GTHSDArE0cDnN+6UB6P
	 KxOkpJtyrQziSvUGabIV2APcP4ICMIWOC5+0uw846pZRJVk5USx0KMDniFN08ZxW0I
	 KzjrKAUgJLm6Q5MCVeM9BK3ds+4hWQkmMeePw/E9QH7mpnnnO9UNZXUv3Ntf39uIxS
	 gvM7W7dNYaXhA==
Date: Sat, 2 Dec 2023 20:41:12 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
Message-ID: <dutd7zn5avelyujiyb6k64luzu2pqccy6ywhfj52i4g2m6ld47@2aqstxoekqrq>
References: <20231002-fp5-ufs-v2-1-e2d7de522134@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002-fp5-ufs-v2-1-e2d7de522134@fairphone.com>

On Mon, Oct 02, 2023 at 02:30:41PM +0200, Luca Weiss wrote:
> Enable the UFS phy and controller so that we can access the internal
> storage of the phone.
> 
> At the same time we need to bump the minimum voltage used for UFS VCC,
> otherwise it doesn't initialize properly. The 2.952V is taken from the
> vcc-voltage-level property downstream.
> 
> See also the following link for more information about the VCCQ/VCCQ2:
> https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/1590a3739e7dc29d2597307881553236d492f188/fp5/yupik-idp-pm7250b.dtsi#207
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Depends on: https://lore.kernel.org/linux-arm-msm/20230927081858.15961-1-quic_nitirawa@quicinc.com/

I'd love to merge this patch, but this dependency doesn't seem to make
progress, please consider fixing up the outstanding feedback and posting
v5.

Regards,
Bjorn

Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD5E261B8A
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 01:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682175; cv=none; b=jBYLwMOJoVMiC/+pNDJR3q6PFWTwwn2umLP/MrBUuGI22t+5pkf68gSFkDMSIJCbyi8+yNXAFp5M7bZISs766UgpzR7zXhARkeD0AAO3LfaiXcVAMgSbq/kLf9x6iRvlk3g59ir5c/2GkOFDjHdbFS0kc5fn95fPZgVd5wPRWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682175; c=relaxed/simple;
	bh=Fb2RvlPthRMbJHz76ifRC14D/3S7RepOataBJwvJIzU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ec4f+3I7yZVz1l8W34ehXQj8gtQPZDgorXUcW5bXEJdbkbTS55hYF1+Ax2IIo1TYh5O3KtSLxrVFD9YEH7RNlELqGNWiBYSNE3dcyR0tUi9XY70Z+7lFF/QVle9xZZ+uctvwTCPrUq8u+Bd4DCaVoJIUfNNmbO26Lj//xVoIuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SI3rS2+D; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SI3rS2+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784682168; x=1784941368;
	bh=zmUeWeO/5cXvxrXTIphGl85xjfF+DcvBD4+OKrDUNio=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SI3rS2+DTnliZxpV8gjOQhm/BnmBebiQp/F26MAi5VNIvbcaS9qXb33i4kgLMpglK
	 zgZqOsrJdBM0puXJQ0wbM1RcXLqHCt29o9Y0mDGsjN8woRqvVgbSoZ+grXosw2cZVr
	 7nBeyhrQSAt2J1YQJa11hApiX5SmYQh/jghLMUtVpBxnmny8zcuNDrjapgzmRWBCj5
	 qd5QxncCRvGHzjubEwFqiWb8/h6tTs3+lmY5jShJgDvdQtL889Fsa5cYEgfMPuzn29
	 9+/mhaTbJ9SIeQn2P7EGvDb/cAi7IMwo+TxiSGyAfWQE4/qlLGY6E/+shB+fNSc9+q
	 2pnryZ2FGMHlQ==
Date: Wed, 22 Jul 2026 01:02:40 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in qmp_v6_dp_serdes_tbl structs
Message-ID: <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me>
In-Reply-To: <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me> <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me> <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af> <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me> <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: d0641d487f73adafd5e390dae0e487ae27b72b8f
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/21/26 8:35 PM, Dmitry Baryshkov wrote:
> Quoting commit b5383dbae381 ("disp: msm: dp: add pll params table for
> 4nm PHY pll settings") from the SDE driver:
>
>     Because of changes to ref clock frequency, few of the pll
>     reg values are different for kalama compared to palima.
>     This change differentiates between these two 4nm versions,
>     based on pll revision and also introduces a pll reg table
>     to differentiate the values.
>> So, I assume, that v1 vs v1.1 is a clumsy downstream way to specify the
> ref clock differences (which affect those tables).

This does not seem to be the case...
When HBR2 is used over a direct Type-C to Type-C DP Alt Mode connection,
link training fails when v1.1 tables are used instead:

Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_ctrl_link_train_1_2 [msm]=
] *ERROR* max v_level reached
Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_ctrl_link_train_1_2 [msm]=
] *ERROR* link training #1 on phy 0 failed. ret=3D-11
Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_ctrl_setup_main_link [msm=
]] *ERROR* link training on sink failed. ret=3D-11
Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_bridge_atomic_enable [msm=
]] *ERROR* Failed link training (rc=3D-104)
Jul 21 20:56:39 esteuwu-phone kernel: [drm:dpu_encoder_phys_vid_wait_for_co=
mmit_done:545] [dpu error]vblank timeout: a0821300
Jul 21 20:56:39 esteuwu-phone kernel: [drm:dpu_kms_wait_for_commit_done:527=
] [dpu error]wait for commit done returned -110
Jul 21 20:56:39 esteuwu-phone kernel: [drm:dpu_encoder_frame_done_timeout:2=
731] [dpu error]enc37 frame done timeout
=20
> I'd suggest adding the comments about 4nm-v1 vs 4nm-v1.1 rather than
> renaming the structs.
Regards,
Esteban


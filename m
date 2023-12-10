Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85B1EA95;
	Sun, 10 Dec 2023 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttK2msjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A15C433C7;
	Sun, 10 Dec 2023 23:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250478;
	bh=0SwR15QKyjc4lI66xJvZglqK8JbLrcKKmOUbpXT8Ayo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ttK2msjgOje+AoxFh73cyyDL/lrykNpcUpeXiFWJMvx8Za1tDvJSg0vKx1kD9WGGK
	 qn2jNIJQp7eGXUIwuGOh6fYFCD+EiXj+IxSGKvwoEifkwhmQfIYNivBNpgMWRjsh/O
	 HLJIROmPDGIllA1ZB4PZSD9CK13aNuisPFY5UoVS/f+Dtldj68giHvOtyNdyw8nJSE
	 7AAlxr0i//sdJmy3d0jsZpxocv1/tFwTrmQFXXKBHwJG++5di3+m4xbacyqEGE3voM
	 Pw+AZL33Vho3chOCavh7kG98m81p/99b0KmkgNYsrgZFpvHHiOifIXrJf+DYf4yF7j
	 tkcLb2KHoBRtQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Add GPU support for MSM8226 (Adreno A305B)
Date: Sun, 10 Dec 2023 15:25:39 -0800
Message-ID: <170225073880.1947106.13814955780498135531.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
References: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 21:35:17 +0100, Luca Weiss wrote:
> Add the necessary bits to bring up the GPU on msm8226.
> 
> Tested on apq8026-lg-lenok.
> 
> 

Applied, thanks!

[3/3] ARM: dts: qcom: msm8226: Add GPU
      commit: fc209f869310776c437daba478246df64d82c38b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

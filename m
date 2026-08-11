Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5478F3A;
	Tue, 11 Aug 2026 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467813; cv=none; b=jG7s5kZ8TqswoEhSCV/K7Vt8LcuOCm30J9x1LyBBlwWkwlp6Uj+V1t8KDdamODq9oyRGDWlbT+vb6McItznxvVC8KOoKkIc0LybZNy4eT1YjSQUYBnmqdRosdhcuJzI2ufam01n70gwxLgtPYv7uysoBf29B2gjXRymHz5sxB6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467813; c=relaxed/simple;
	bh=CEVUrGcVJIg8VtKZnQXZ3FiwTlPzn6EABXI4KijVc50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XlcazAuvWTIM0ab6rO4/ZXYQTGQ5ZXWeBXyDeneQ+lJUbYszA0WyGJsodOsqsY6JzLrieEF9B1TK3VhxpI2VUVDHNGIlp9g9B4mDFYw9k7vmiUGr9tm4moljHUkIcXLmaiK5X5qS1V4DeON4W78WkDsMLQ8uE8lVffaZwr7C4Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muImfRdm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muImfRdm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFC51F00A3A;
	Tue, 11 Aug 2026 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467812;
	bh=IhSbdLE67Z/rWQ24BOpqDsHU0kUT7TNjqt6WGaNj9jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=muImfRdms678wpFX9Qw7qu04e5t0IewdCkZlg5pw64h1/Y3K/6j4SVOz5y5vTgfs5
	 dnoEppNoiYcHge593mtCMG7OMqu+zDsHD2Rg63/Ozl/ahmjM8EagO3ptitNkNRu0aR
	 NJz0mWz9j0LcqWnEVzuF3+IuImpkRRY07F7bq8WVB93h1Zxxs+3lyQbs4gIpRCsweS
	 h6UCJ9s7vd+tgd0lqBtXjxzjBtwtj74btaf8PV4sO0ZGJ7v4QKADBsQWTJoToAfY7o
	 12gFUNesNJNZ/F0vp26vrCnnn5ohU7VKEBYd+u6ONJIWHLb4mM7ooMjx5LVLYPmN87
	 /dN93rXa5r2sw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me>
References: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me>
Subject: Re: [PATCH v2 0/2] SM8450 QoL changes (qmp)
Message-Id: <178646780866.1081354.11462372432065642489.b4-ty@kernel.org>
Date: Tue, 11 Aug 2026 22:33:28 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 11 Jul 2026 23:13:16 -0400, Esteban Urrutia wrote:
> These two patches drop qmp_v4_calibrate_dp_phy() and modify a pre-emphasis
> table for v4 DP PHYs to match downstream behavior.
> 
> 

Applied, thanks!

[1/2] phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
      commit: 481807f939077059db278edd0467e7e609b6c9a7
[2/2] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
      commit: 8fd2b30d187fa33e5dd30699d3e3a3662c1610c9

Best regards,
-- 
~Vinod



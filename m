Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA347ECDC
	for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395686; cv=none; b=ZsLwDIo+WVvJW4kUplrNDUGLPHShoLzFg+Su9GktytyIYI5xtEIpv+NabjX/zX+wStrqgOeChMpZb9X1r9/NyTQFzkDBmxvlV5SDftmZBA1KkigVd3gs5EKWOlBVilL2yTWboPzZ2kwsu5XKUD5mtost6NGx7WxPM4awv+yis/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395686; c=relaxed/simple;
	bh=qpr20bFoWIAVz6Uu6SDBY1Onol/yGpj70dm5w/7HmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXi3Gki57Tyy/TWwN4po66K8f6VShyROxR03akVb/gPssxbh24K2jYfvdbJA7t0lMqS5ogGxKgSeVVzbosUQ0GjhdXksgSLTyZEUUwopZ6iOvU/DBMlqUGHh1g3EJQC/ANUqHBdG+e5ZyURKSuojBSUcMYxNCVvS2GN2bOGpJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAA0sVec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OR2xeCkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAA0sVec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OR2xeCkb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0YUu674516
	for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hsC/n5G/ysH1TDMPqrs15Xr5
	Fe1eAaS5X/4GfDOh5vA=; b=ZAA0sVecotuQbIutF2EPWz8avV8PBXwK/D22V4EB
	T7JIXLLQ1Pw29b6EVFSY0wTE0TlLHg8qvV6Ovch1DnuNa6WKDmsBAgDOqC5PTuHw
	CixdNiZOG/sxPSsQUkr2Jpm8dKWiAr/QMr+AD9bvsFRLx/2dX/P8Syg4vKCUUFV0
	L1N+4XVPHfeVUI6LLy/0yu5JJQapY83jolFHwcayTw30aMwBkLJUNgcQzrjDmiuy
	EtLVZFaInA13UVi4sYGXkQg5Tur2Nc3gNJ1GHg1TMmmKRltzL3ZNdMRdbhd0y4qk
	MjDsMNpT3yqlYInbKgzhkCs/Kot+rkHfPMWXQuX82Ttt7Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs945b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-792f917d31aso2773081137.3
        for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395682; x=1790000482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsC/n5G/ysH1TDMPqrs15Xr5Fe1eAaS5X/4GfDOh5vA=;
        b=OR2xeCkblYpskG3iXWILACEaPR5F6YEhtk5ZdFrEPjgOHCNgBlSg3y/TElArYIPM0z
         cCA06mE4Z5NiHrAmt8xGqOA3oR9rHBSuUQRVi+a2C3VEcjBKM+2Uj+2TPZFaicF6HFjw
         HVf95pmXQICTt2eyCgUqCYR/elymaQ+qEdeXoJx73z70UuVSTczrHUGo9zMB1XH1GYWc
         FXbjeH2irtkG/xG47yygj26jox1Z/mYdPftAjkhessKzA2YgE0nf0GYDWJbkHMS/REdf
         jdVdzryj9q1fJ63F3Fbpmvdvro16u/9HHnU0ocmw9/Dg1y4eoZX2L4fY7bDyodgtxEag
         oBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395682; x=1790000482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsC/n5G/ysH1TDMPqrs15Xr5Fe1eAaS5X/4GfDOh5vA=;
        b=RB1EkLxeSwrXsQpNNVTj5DWr7bFWv4Qkx4dJQApYkuUGdOPA8IS1b0zg5vsJTvicCp
         lROfhI8Gx3Ux/9BWNq4+T6hJ1nA7XCKjvVtlMkxcMSH+6apRCVYS94P0dHrhFgtup3SK
         MYsOZuIJ8F2u11BrTyVXno9Pe6f5K8e5cCp5YWdQVbp7fb3ZoMTdvvGH6AguLCmqcTzQ
         hol+devLtpvp5awGK43LRRE+j2N6QMH9aDEbiemhJ5Fb5Rdn7Qzfvl3mcBs0iFhk5MfC
         UjDaS7GuurO7+Ew6O0Nbori4epg3Gz4qs4v5haH5GIBKuyCkRY0akEsA72piienkrVyO
         lFsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/u2QJfzsRQntquaYiCWukOUq6amubp5glnRXprsx1xauLvsm2Nl1V1RiONPi4jZmhcVXAEC+gLAZtpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l/T4w6OBFieKJjRQZ8ASfkCtWrYDhIl+r/L5aGEAE+R8S+/0WI
	+3E+1QJ+ZjYR7Dc8PaJEdW9VdcvK+Nn5ZjpmkdJCwnwfgYnWlroX+eFx+qezgqtGdYBnM8xvmGf
	lpvlNNmgiMmtyN245oJPQQWbUJ0cJKnS65/3It4lbpNCk5NnTbIW686cJbgd4ET87iQ==
X-Gm-Gg: AYBFou05LPb7FOCJXP5XBTrtyzKkgF/wJ4IZeCWxXv5enz6XC/G2VV0EpPycZwJvHyY
	qPgBl1NeZY5zOkZ5L6H+FoK6cDl+v94+O5nMunwWbyih3njj7IgiuVhIJGEtHNV3qdnh1BDqX8+
	91IrlCxxy7C5kVISf3JgnuXEHNXSTBKOYwU9Dmp6o43KcPDfNF2QOJudooh5Z30uJ4cwYhRXMtK
	7D9SclFdJRcZomibrKMQ2Zg6+ON0wWVZeyDvOii2kFlJ8O8QViPbIcPPbrAwEZKKL8NtMivzMyG
	Lo8d8DjiMRa3/sR63sFo1x2uK8V82xDd5g9lIJ6b8mAqPSIViPxINdNCxS3q7gFqlHsuEXhrKEk
	+vWS9vou7As9rePo=
X-Received: by 2002:a05:6102:548a:b0:79b:dfbd:d0f7 with SMTP id ada2fe7eead31-79bdfbded2bmr1731006137.0.1789395679762;
        Mon, 14 Sep 2026 07:21:19 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:79b:dfbd:d0f7 with SMTP id ada2fe7eead31-79bdfbded2bmr1730677137.0.1789395677612;
        Mon, 14 Sep 2026 07:21:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm477423505e9.3.2026.09.14.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:21:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:21:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
Message-ID: <z7rjt5237gdtytb35chtyjposyvqpgqfsxhov2all4g2527aix@dabjw24dluwa>
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfX6zAbRBMsVC2X
 a1zfcsURiX/LTXuXnJi4PkNLPYeXHTMhFC2ep78mAqnXBgbYxLadrsgLVz/PvAfCUm/1Hu6poX+
 2hZTvcep99yq93udaJAC7ILl0pcwmRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfX+Dw5kKTvo4n2
 c4jsDHOPEWwDlLzdtamyFsV3zHQxyvzzA8DZ9PYdgPy1apshqp2C6TIdYqiepAUFTPtlRJGfH0c
 HEujSh51H/FHfuhG1fivzCKwwHMnIP9+r97vtbQGkKU/w//JvtEc3vbpgFEPrW1vja/A26spQ4N
 4EtRXW+rHGUok6inyuCxD/Feob5tqd3rhhMoXdWF3SOUZm44gcVkWFc1apTQr0GJ14+1/b4vEyl
 wGE0XW5kY7lgPnIeABdXAIeDSsJkxE1iWtontALy4UmWOGXPWcRGvjRy9Ic6cBbgWt1CCLzHd1d
 AfR6PUfEjrQ/S9/CMOpAtVRm8g0MctYbdq0KQDEQ/bS0TE8FdlkyMH3//bNjEl0npIwq2oOqp1o
 cGJakKsk4qA5FgUNm/0md9kKeUwVXloEdtCCIDG7IrHGtwyNXzYLX2REfOMGe3+MZn0FsUExBqY
 TBLOuhMBNW0XZ5PxImA==
X-Proofpoint-GUID: tgQQF7_tkaxmaOIALxHe2_gVAXDcfEzg
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa802e3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=CjuIK1q_8ugA:10
 a=TpgoBOgV9RAA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: tgQQF7_tkaxmaOIALxHe2_gVAXDcfEzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140205

On 26-09-12 11:39:24, Muzaffer Kadir wrote:
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

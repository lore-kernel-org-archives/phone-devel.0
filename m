Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CB2DA779
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645335; cv=none; b=utUUKsdJr3A6/Jezpz/CoOYNP+UJ96z54+mVzraCJYiZJMak48gUQdg6vRKZzkvcu3iYb7vzlfdO5w5w89V9XDPK3vvuOrBtd/fdDCSVw/pZlOTNKHptPzZvXi/axCp81borTEBDkA/ITY9Vfgo2DOR5BVtcoE89WUUWnbkn7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645335; c=relaxed/simple;
	bh=J+Zwp0E9tqCVCXtH1TLr3bcBFxCc5MDrmVDUvbChza8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL9Lx94Hl7WojfRU5Aj7+ikXOjCMmTL2v7UbQ5JCVwKvNwj1yrfYYijANCcDtBeViQyO1qEcS3YOx7D2j/ayUY3DvpV6HMO4LnENErIlrZeWEI9LqqPaywv6Q4wfqmvDaPu2eKHm0yw1auANXvF61VjlF3NAZ9nSuJ5vx+w8XCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRoQMH21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRoQMH21"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDLNfG022469
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XW25WTUPjM0HYbFzO4qQOv0a
	rYQaTxvpGuWa+PN/BYQ=; b=GRoQMH214l9ZktR6yEwxRJNDcIkLrBGBary+WEiB
	gk568wNkQnbNtkD+GEL1hRkPTWZ/2dm4uFYIutRag5FBldkDVnAWfyXdr2+zYpbr
	qx1FYrJ4jOq3ppXR/hcqkq+JfOaBuHUAjRUToTk4TAHCykw8Euz4m9BqNQLBh/tG
	/g5mHJuHsoxuQNOvChjTXEy+l54mJM6APFKcXFcIFrSTuiTrba9o4mvG+mIGXyuR
	LU0RrLb5OVeep+Z9OjfIyzsNzYaiNpJxTeb7ZsQFfDHKXvliCzJjZw5In9jH7VFU
	hQTKA2+A3pLHJkUm1BXyp/86N9+KDx5TaelhK3jit4MsSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0s93h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:08:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c0e0d12ddso39992016d6.3
        for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 13:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645332; x=1761250132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XW25WTUPjM0HYbFzO4qQOv0arYQaTxvpGuWa+PN/BYQ=;
        b=h4qodXk27HzU49DjfMjvcE589rm05sQw4KJzIru5B6HfQeBtr66D0LWqD4CFMtEMq5
         w8fGo77YjCAYI8lW6wADuKBL3EtSTpW730r2Yra5iUNkBrxS1nHzXu1diBJU3ZFmuz/l
         YHakiKle5ly2OdWhjuyHjwLCmy+1zsYZeewx6beyY6s/bQCBh0U22aySPyHDx1yi8sNV
         itfvNQx1z3Q9J1hHuwJQZZJAhU95FcalzZhM029eamPRTp9huHfhvg5NyzoD0EhNIBgX
         aZPjkMY5vPwoAgcy8keeTL/siT+25pwCK4caOH1gsMnHt7BeFnJD3j0ukTGVRc+ijxXQ
         yEqA==
X-Forwarded-Encrypted: i=1; AJvYcCXIK0GXHjd/WdpLOSEphoDTokpti3cqztH1agMBPNNvWvE+a5JugjW1NQ7DBUUyEKl3UMwaXYBSIsQ+HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxb0fgZ766xv48rJ6nFXiswPdTzvXgwMLwZ3v/W9mX6sP1ZLX
	SVh0DWC2ILs4aaxEUOB3EdJr5ullxePq+F8464PmlA4F9KHzdBHvadhwczHsgdZ/rov16L3zUxd
	7auCknvdtdqYWBgjNlMiLEF7WdNI8LFGJsnsqcAiFeK/01VlZqG8c4Qfz8chnUuoJCQ==
X-Gm-Gg: ASbGncuXSsxp9rUfpdROjjh9b+pMuLh6tJPg46ddOQC63QBRtn5mL+fjv87N90keADe
	ALsuFbbHlPnAy2IA8YeBwTEouOLnyu+f/jGWsiYKXFozkFor/yglNNIhEjB3eI5Fs1B0FOrUfwj
	IrjgsrIlEvFnAvUyy6h+Iir0CqDCi/u1TEkt4ANga1VfmuMBZ7q0IolFZhG4IahLXtN2TMDMwtj
	8ZntBR1PrnggVBrOxQoD+1cBafOi8D8e0PKIy73W1nVfH6eke+mBKhpHvZEomZK0ibdBeLUcJ77
	jfKfoDW8duNKtL9K7TGBsSObQYyHgtVfNX6+lqfgT1Nt7kjf5yppGyv1PfuZ1ivUwBBCBrIU+P4
	MPrWrWUxFA2R69ULxpfzhSFuXm3h8uPbB4M41OERhynug6wWLd6LJJGiJlaMyix00S9Ysa8BOXc
	faPOeUUJ7gGTc=
X-Received: by 2002:ac8:5fc9:0:b0:4b4:8ee1:7d98 with SMTP id d75a77b69052e-4e89d21c3d6mr24692921cf.8.1760645331607;
        Thu, 16 Oct 2025 13:08:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELwSY0pYfGnC1kz4S53qSyk4kBH14qSenJ7X/Cza61k+EVAgrYsjLisx7xZsfpWVeiZg6fEg==
X-Received: by 2002:ac8:5fc9:0:b0:4b4:8ee1:7d98 with SMTP id d75a77b69052e-4e89d21c3d6mr24692431cf.8.1760645331106;
        Thu, 16 Oct 2025 13:08:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm7293872e87.50.2025.10.16.13.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:08:50 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:08:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
Message-ID: <62iuzoisxavlgadhz3gfrlwxqu6vl4gtlyrarjkmwihepjr4hf@nuzpsaj6jcg3>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f150d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=CJSKMeR5ttdQttduZpoA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qXKOVW1W3Of9vTnf3LsydGhY6nh5cFR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfXy1KytG6hmIpI
 xpdHDboexrt815nA90YOqm9g3V598oK5LxXw5q7ZEpytiEIYsUWXuQ6arBgJqGEAkRlY2HF0dLw
 d6XMNKE9Yk8W3kF4KBbb/wUslNv3PdbunRPQCSZuW9TtUJkzmdXfHudZyfqY65b5Bzqb7yzf+0w
 yYEPn4slqbsNGtb9CLap5mC8hM8qlIvtFb2fFKaU/eiTaEbr2XAo53POEJAqtwbBo8U27S7R2aO
 4Jcas3D659V3u4zOVeP4zQ9TtGlNtzk1ub7HrHSy0sBVOKOmsqjga48rf0H6gto5BtQ9vvEFKuW
 FfD/bY4ydHNef1PvzKBqNffIUDoK6zH6CtViusm+nN0K0hbJAojM2zyvSE0nRZQswLRU/J9Lkbf
 P1gAVmNtktjh9coiuULcZLEt+87cIw==
X-Proofpoint-ORIG-GUID: qXKOVW1W3Of9vTnf3LsydGhY6nh5cFR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099

On Thu, Oct 16, 2025 at 06:16:57PM +0200, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CC42EBB89
	for <phone-devel@vger.kernel.org>; Tue,  9 Dec 2025 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765319871; cv=none; b=Wwl+3xB7CB/7wvsF5GvJMi1bO7Lno2Y0JNyQDUcywacFKqphvmPGHyN7R+ZCRrHWvVq6nonnEnXPuaOtaYDdHF+TnFNhXwdl+sYf/7ZOkSiBLZFy3V7a0Bl2xjetRJY+4Yn4fuYipso49CRt15W3u7lqgvYjk2TIM3g2iR6Zev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765319871; c=relaxed/simple;
	bh=iJ7DMl5JUfZn55mCMCUFDFtqAA/ov2OkH/OdV2jVd4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fcwrfv/iU3gEH/wMLn0y7Q3zd6FDcV8HtDM97HAxgUFvoQqriOGaN2qcJapcW24OjDP7TtEIuVYD1aA4pikTgH7kKbSPdUx3A450tx4vc/8dHiLv9u8luifnx9LZ/CPXlAW4i0kJBDMWkzN7eVSbvzB02aEZ4XguciSDwdMa7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvFRfxI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0Kr1MYi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvFRfxI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0Kr1MYi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Hph0I226634
	for <phone-devel@vger.kernel.org>; Tue, 9 Dec 2025 22:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RmYc9tivKNP3axoENaRa+NYj
	Ro7tGvb9FspT8p6Povs=; b=NvFRfxI+UkIwQKdft4+YkpqUTuusNi4zx/VmTic0
	Ew5zFEV6t+jMEzO8SnIA4K6itS16RrXdafpyX8u8b7oPV45S0iYAYycuA0nvC0sv
	hb/YV2TtCuIlJMaK/SlBlX/LnfNtBUIQiNOMu/Kp+3LYkQomHjqYkQzL371gsGsB
	0ZnPCtAll3VMmy+HQxNQSKkGNQxjhtwxYWr1c0aJAuDqDLQtRgs5lj+FhK6vv2a5
	BfK3XzZERSWWme0DirIgkuOBlwznltlc2zxZfvC/mksT5FlaUlwnSF2Bdd0KS8yI
	QCy9llDGL+37Fb28H+WsALPjR14mu84Iw0DNoOxW21FChA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhm8r60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 22:37:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559836d04dfso240371e0c.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 14:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765319867; x=1765924667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmYc9tivKNP3axoENaRa+NYjRo7tGvb9FspT8p6Povs=;
        b=L0Kr1MYiKeL2InFhXqvr8AEMHxuewEhz74O7ZLaA4iPml4Dr+oCNSE5yudczW0bPJt
         0ztMXMHvt84c+dtukJ22LP7upLjG3evj1QEV+WUPmZaN87UEFW/J4feNHHmNmjKilpdD
         WboQkHh0PR+eDOVQ3eeeVnJb0Q9ndT/oTV774o2eeXGkEtO1TAnfe/CXqvZRWwXbONxi
         d4d+avvKErq2E0JZJjuiWfNn0Vtfjt4YA2VF9Njj+qYpumAOa9hkBLKFSsVL9byoL//a
         4QBg3C+6e4F0FkFe+KW3yrk7//JObTlJOR074Bj0SSm7F3pgO/L7qkpY7xugKnKt6ufB
         1rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765319867; x=1765924667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmYc9tivKNP3axoENaRa+NYjRo7tGvb9FspT8p6Povs=;
        b=PMRXysAXZJZHhTLtXl5tk/C7f4nW34EOW5BsEbucLON9pgCbDSI2l2I/abc39OBtAO
         2vF+JJ0kyre6x3Ng9PMjRVTrUvD1773o6SamZR+s4zlU2Pu0Ik7oqgfuO6wOcf9s1uNz
         ZhmRINREp7tPlh5xw+PwaGMf8OEzI/dsR7KTqZ2C6B1YPfU4/Ds+vVrpn05dBsUoS3EV
         DWGGMyzs3Hq7+EYbfDNtkV8385y0iRdJXLfC/tnIrNzjrzNIWrECLAXvX8w0+2BtEnJ1
         RSops+FlkRw/VvHISbfWpRNHixX+IIJWNfMR0gBYqf7P4gd8yXtQ4FmM8NtRfZrMIgyp
         hkHw==
X-Forwarded-Encrypted: i=1; AJvYcCVlzkPF5H4siGLF7MjH3uhUrQd9u1hH2POVAWXKUQyx+w/CH+pN1bDNlZfjQvwEFBFfrf964TuwhHQ5Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz77z9k0I9TwBX6EbLGC8HuHyd+Sbt+g5R5XthOyKBnvLl4rN52
	6qyYEFNJBc55KTy9v5aeQG2CcHd4301HBhpRDXi2u7AHyXldgq4uM44829iK/tP3nes5XM+oP22
	pIs2bfMHbLwUlORemkxY/qh0lZx6AQFCAXAHVqq3fbdyO8Orudd+CzhQImksLRaDEvQ==
X-Gm-Gg: ASbGncsRKZs5UGwEYtx+7SBnsfV/2WqJ2FYz8oBVWbRNcbdj25KtQZX9747wRNzGTK1
	NR0dVgZaQJqrTiEePs4A4Xwk8GQy9XxT4A6w6VpfB2iAImi7gZ79zHHU2+hLggkoAg4Dbq5bYg/
	D6fjZB02/rS279TYrZEAlSNC354oBwN5YzBYs27VB8NIWUQDMF2W8YNbfCTIN93KZ/9jlUNzQeE
	0987g69GDreE52Byms8eVfkk9ywDAQNEa9x97GOiB9bN3VKYNdnaq6ChR1rEMvomkMkdFKCJ5uk
	USN+UogPM+Azd2aWYZ/Fd+OudP3dJd2/Hu1dR/uL28OfTblPQPcRKiA328zUKE/9kuoPdgEIcNQ
	GaafDQuvPQQSDIH/tSwoVa71Uw4SwTKj6Y975fiSMBg4Kb4snvx0PW0Ujhn8v7aZCPMFSO1kdvt
	TbiGmRHYa/IVX93+/4/kreB/g=
X-Received: by 2002:a05:6122:20ab:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55fcf91f853mr240063e0c.0.1765319867455;
        Tue, 09 Dec 2025 14:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTVjEvn8TnwQni6UudT4sjJRz6IdwOXl7bjJWPhCVAbIL5oohiYT+ArJUzEVrPPRTBvx1YPg==
X-Received: by 2002:a05:6122:20ab:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55fcf91f853mr240040e0c.0.1765319866970;
        Tue, 09 Dec 2025 14:37:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e7065b4b8sm49658941fa.45.2025.12.09.14.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:37:44 -0800 (PST)
Date: Wed, 10 Dec 2025 00:37:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Petr Hodina <phodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
Message-ID: <lilbxguznfzupg2gpfb6xuj4ickffgtuwwlve5g4d22lzr3bsm@slkmhn4agvgr>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
 <20251208-pixel-3-v6-4-e9e559d6f412@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-pixel-3-v6-4-e9e559d6f412@ixit.cz>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=6938a4bc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4QeEDP4Y2U8xtt9THcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3NyBTYWx0ZWRfX2OtcHvX55qku
 FtDYnquzPzdVg7TSlZvI5pLtSdWhSFPlo1rGBaMasWUveq5PVdwyeDY0mY9+d/UGKyB3Z7B2CCe
 rj9WSEgzBSGEmFJIXysbY9IfvywEfQH84qaKFElQZM/xL7ONioPjvKJUQgOh9OEdH3VfjjWT8xn
 vtEIB7hBOohTL2QdVbVJNXU62cg+Krkrpo85X51zfb0rQgRE7uw0vdCVWzOwBBiJ635MB8tlUPU
 3ef3rEyIuV1ajnQWkrQi5ZK4BgQhasnOYXm8X4eQigpXgtvDzCdtg69+Qwu8/84WvQ/ryKwzlWE
 WRqJOr/GpaB9NeCCYb0UmALcNCAOr9UxvRGKzAvylj/8GIm8O1XwOAUseIgQsvLZrYFq9Wesfzv
 u+h/MZDkp4nzoe7Ff5n2dBlpeKQkdQ==
X-Proofpoint-GUID: _XDEohyQJcfU1Aj2qlsOhJsQ9qqA5EE1
X-Proofpoint-ORIG-GUID: _XDEohyQJcfU1Aj2qlsOhJsQ9qqA5EE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090177

On Mon, Dec 08, 2025 at 10:41:57AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce enable(), disable() and reset() functions.
> 
> The enable() and disable() callbacks keep the symmetry in the commands
> sent to the panel and also make a clearer distinction between panel
> initialization and configuration.

It's not just it. There is a difference between commands being sent in
en/disable and prepare/unprepare.

> 
> Splitting reset() from prepare() follows clean coding practices and lets
> us potentially make reset optional in the future for flicker-less
> takeover from a bootloader or framebuffer driver where the panel is
> already configured.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 47 ++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1532142A
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537380; cv=none; b=VukrL+V7A50dxh3SkG3G1gg08WhzzevR+qSRyI4ALNjN1w4dnpsebu+HNwPL6YDcyIE4ob9VVwyA61GDZPu3CXWtUTHrdU3i4z6yXCTwpIBqf9rvXqe+YMAB3dT5Z8HxYsH6XTE8XD7Hafe/2p4BRmJB5HSZarmV7ucW29ftOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537380; c=relaxed/simple;
	bh=zg/ZWTxcyR3E8ps5zz0SNuakKqCsCLPwWf6gsRPSY/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2wuTQRcVyG+DLdkNRMVIpICZLMdUnaqN/Y4dSd9dKardJvp5XB01OT35L5UCX2LcUofDagVYZK9ReFsZh4Aui409LWe54Cv+C1sDs8dMMBuA0qXn+jXbJS3mAL5pukBEcqMPoT432z+UXuIwzDrgWMBhkrzhKvlcjWMOkBXuP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL+x2GdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS+kszBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL+x2GdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS+kszBi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4v2rq1031283
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 07:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R0I0UG4zGGjNwh/RIuy9/Cv4
	md8bLt+9za1Gu7nmthw=; b=WL+x2GdQEMmowdQurSYGLt+bx6s4g4MN0XdG5Jtm
	0gkXU76EjdeWu6aznZqPR3MrtazsOfncLPxCUc0gnMtub+xmM03z9ruxCdYziC7I
	x0ayru3OONZQuHHuBtxkMrvPh5VPaEVnSaWO1O++fJbWrj/MoA94xFJeevTe2zKT
	+JfAPvOSlyciRedVdqFz68x3PUa+uBnpn93Iv6GHp3vKmAHZ2dcN1A2N7VQ20a/p
	qVnRT7E4LctLhnyVspOA4hMd3DAPbXvkRlXzun+8yJDRobQEhFr4hVQShxhPTwkW
	9w4muAmwEk33omR5A5AgN8TCJvdDpeEWKscEHvBurgRmGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7anrdmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 07:29:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so143250711cf.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 23:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537376; x=1764142176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0I0UG4zGGjNwh/RIuy9/Cv4md8bLt+9za1Gu7nmthw=;
        b=RS+kszBivInjrBI/W5LZn4NjZmTCiHpigp9kyz1Y6uTlarHDTn8EjmCZc+AM7Mp6q3
         Mu9aWqqZrAHSy7G4wIc4ox69VvuX7cj7KviX6yVxo9jBcTBomjksJ70qbeI6/VvEGvc8
         gZ7TOXOcyoq9Jy0j51Em3F4ygygxSt9tjfw35gXORzCIcbfy1Gfstr6UL5ura47DS6j0
         wc8+XHe4nIhevQJqMSvfXE47WfuzsHb+scq5tQRVKQAjI/xGe1qhwmM/1HhRJRwNL6wO
         eBBq3xq3NNDScfE7Vp/W+f2jf0frukBP2OFaYEj1V/icyvbInHV80uZ/fQBeGmsSuNnG
         KGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537376; x=1764142176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0I0UG4zGGjNwh/RIuy9/Cv4md8bLt+9za1Gu7nmthw=;
        b=O+4GFPCOd+XkkZPxbSkfeuFVsHj/K5GS4nv46mfpU9bc4x+QJ4VLqOTt52sDsl+vqA
         dkKUCcGvGOv053CYwrkl3fN1bZ5lfrSttObxSdrYpcaxXYZ4s1OL3HzaQwj/LiND+kRu
         5HCygI26nYut9UUhOylFqIU795xfqevWjSaAqUMIxgy7qNcKYNx51XD5179MVje/Xi59
         deZlyOT/fl43fKSvrX3rdPRHxKqkSwBhKHmWhtR4k8zFKc/yK5mk5rWh/zr9l/i6oVJX
         7kxRCMSbxCmpWGuY6vviDSpPUi5ljgA+eC/sxI0RA8J7zkz0+yAAyp4/bZH9Xbh0IplC
         EBUw==
X-Forwarded-Encrypted: i=1; AJvYcCWtLEpdx1HDB6fYCnOPIJZl6JXTQZfYTBGMfZzyThCST3MCrEjMgbeyURbB6yFtoOwuV1Msv8KLoYP43A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5aweEWJgu6Rv+629nbeaKAPpHCqAoULaAZDhVZJOQ8ve7PFP
	eigGJ6uWfYuKmciJoO4vgxSsj4sDn+PK79pwUcInUNsNU9hSeelslRrqhDy0Q1qajFatYNynBZb
	zOBieQ1cRXraeI+z0jRnpuY0FSTZAi/+Bpqnwpb/xRNngjkAJnDwm5RWVW8cbfEhEng==
X-Gm-Gg: ASbGncsYB0/JJYtBbjn9ZRjiI8Gag1YjDfPe1qU2v0cRchsOvzEy4LdwvOgskOd4HwA
	jLBYIA444TT2nLgdicPEVUkaUDZ6FauCYSe1sdx2QHs6ZStSjp4SVy0DWE5vri1pKT40iGd/BwM
	hPvvOv/tOJYF4IJzTsRKbyypgQJiab6qtkyCatRHTf1LLFgD6a/co40NdbbATHspuqwRjjzog88
	q1ZxKFHXXzI4fUk1bXWQSYr47XIqY1zpQOWXtpkYm6WkGCk+A5FKeXTy/wudOXPbV1bziKb8BHS
	itcF3nukKTregprwbQGFzzbVkWOJsAUxSRBo6fh5Obf/f+z6kgRK1GWtXv9Phkw+7AHbLR1V/Y0
	KpXr75zvgxWNML1fMgJWti6PhswqOAYsntJlUMyTM/DguXjzrHxNLJuDDm8hYjWIbKT8tMa/WHB
	w1z3Tm1Aite55lapIZaVtacuQ=
X-Received: by 2002:a05:622a:15d1:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4edf215c83fmr244114891cf.81.1763537375825;
        Tue, 18 Nov 2025 23:29:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFictIHYpBDF3F1JcOpRfw7SDn9ivbKXF+srwLX7+H+SCRJ4BCDfaThoIwHFC5rvT+6K9oHOQ==
X-Received: by 2002:a05:622a:15d1:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4edf215c83fmr244114741cf.81.1763537375408;
        Tue, 18 Nov 2025 23:29:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b33acsm4552020e87.33.2025.11.18.23.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:29:34 -0800 (PST)
Date: Wed, 19 Nov 2025 09:29:33 +0200
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
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
Message-ID: <nrudzu7r7mzvjni7xt32owix7dd2arpimelk2a73h6eviekptw@fcbvniyakvg2>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-6-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-6-317a2b400d8a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfX6dE6LXnE/1BT
 Q2AyqZwYSn0DWab42ZaUKpQRQPcwe9iRM6GBBquGDB+mAmLg+VJcaHyMEPuuC5mR9gNW4GgEUKB
 oltat1Q10IAvJI8Nh0CVIDyZVOSyAKc78bqgMc5imV0vQPgrYHYe6t9h344EMvQTSyeKNJvcFco
 lQvQGM08W7V389YlHUGg+DymREpM+fSw0GSgGziAyuaRX3ENXhicW1zVd//Y+F4ZMOySrrrSmkY
 vxhHtBocPoLztGfLaN4BbawZmx0pbmCAbxJbr8713UrV3jad6iCgbPi0VBcSI5uA8DDT43vUajr
 lZWYtc2nlNxiFyLm736PDYikMgzBy8cPRbymkRd2DGprdIktGVrIeNTjhaofJ8ydm3u/3npiCRS
 QIoeosDHvVO4BEHWPvxyLKrB8IMcKw==
X-Proofpoint-GUID: v20pMzcwWlEoJCShtTArsfUun6kffYbn
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691d71e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dnSpDUa8s3b1Pn1JWGwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: v20pMzcwWlEoJCShtTArsfUun6kffYbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057

On Tue, Nov 18, 2025 at 12:30:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Switch to devm_regulator_bulk_get_const() to stop setting the supplies
> list in probe(), and move the regulator_bulk_data struct in static const.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

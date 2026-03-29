Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A61C35DA60
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801615; cv=none; b=CSKTtnHQllb/JiGju0IXEmLhIdUnBWuJozGsMsMrdG+WuJoc6561Ykxz22H/sHVEa5SGHoFsRQU6kpQX95LAEhURDwWsYreheXbcDSgQFvkeCxKuk9iEekLwXyubJ/IyUg98PR7Q8f3YXR1eMz2dVpD9H7WaY5N4DlbK7rhaGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801615; c=relaxed/simple;
	bh=BV2CRbd5Ks1bM7XWw8rz9kW/9XNhzo5Mqsm6ztgphcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/9mtU8u5duIK7EbJK5Xfhs4aSYGl7KeXuKAnVTmE3xlRnhHWyoEoXz1hx9usRNPD71YPuwA3dSCFDPEfapaIyZ6DAZj+aaKAZyoClHBfXmnFV6oFyI7dyDn/K5LEVD/559GEfCaQHI0sTYWQNHXerH29fHDJpnKDZr8ChLis4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaeCLS/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZ3d2bdZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaeCLS/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZ3d2bdZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi3tx1617497
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 16:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fdGyKkoxaQWG1ffBLul/TTDI
	k4tPeF9ND1V5q4icSaU=; b=gaeCLS/RVhM7PuJSy/D6Du30dO75tX/tFs9zmVpW
	Nx/xYZUip9bX3ulnJXW92PvIPnb4n+FIrmLcHIW1kaXNLFulVMXa8494ASY7UBme
	Xo1rRGtoy1sgZ+wvQ3xEBP/G4sCI3nTO5UdvIymzX5zMXUQBw0f88Mu9SxQfjdCM
	1W3muAYy1iiZAhm/VObGybqa6ERgmLviFUQYZ42mXa8v88YUkojouGlm49nuNZJH
	F+gytqpprj/SvWOo7E/4TmYqSDiga6w73SSka5HFos0dn4+MtLU/90IOvhggbFBo
	43gZYc9bVXIPOwbfdib5MNzzHXKPOsXc0VqVwbZ75Tun+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672ub5fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 16:26:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so46177061cf.2
        for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774801613; x=1775406413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=;
        b=WZ3d2bdZ8BWKlwitLlz1WhwhV4FvKFhkQ9myHcgvV49xGeUTGr+Nl9iwSd8egGMiJi
         4zLdn8oGABSf8kkeHU7qTEKM3k1+c78TlfJW2ppq1Lr+TzqNzR07qsll1135MMG+M5uM
         F2wxXmpQSQldtvguAP+DGEk9TKyA0ma5Ubp39YD8Kf3VMNY9AgYbeSlNvy6YI8JiIANB
         +zbruKbGWQQ7QSfsD8gC+4BD9kcgR6ChhO3MJqcD3B3E0D3yW6EyBjNZ1+WuoaL5qVzZ
         lpY+Si8Q9ZZXeHlyqADGp2I/uS1BK4qE0mZjZnPo7lKQ5AIC+l0CX82IQncDDcv4oZcC
         SRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801613; x=1775406413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=;
        b=fbk07X9etUESYHkYngZrjS60GfzEiPvAILhw0MMnxhoyk3mIScXfBlJwKBV9Yyq6G0
         7CLri+PuZh/4hKrWcPxZDkwRfpl1eGIwy2ssjc370L3qcheEj7VcYSJqAX3PLWs0eubv
         aizMastJ9oqNQI81enYcX0MQ/0wUjEeqaOAX0aOL0zVY7wVrlfVvm+2A22sIm5eItktC
         MdLFNXLGeO3Zy+8wMNFLw8hRbzas5l9D0pHJZRXdGvAGP8q3Ilt9gnrmLT63qXCJvTM1
         /ULxR6H972T9/KX4lOogoLl6ku8Hq7J2kHHjPIIEJIfveSLhqMcgVlZEpV/QOPOThjOK
         cW+w==
X-Forwarded-Encrypted: i=1; AJvYcCUrhQtwPlTo44ifBgTjhGIavyMojZMP3MfS0nXytVROCEJAPw+WUejJOhd6Jwayuqs8Urj7aJSYMJjaPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJY2D4FxJGQg3luc1uW8Gh2WCtU6JMrspj80UVkBxR+3NPm6G
	uAyFanXLHbysbf634pGqhxlL8Peu7FnL9fJr6CcSSni6H1uJgzM+iYpmBzr2yDabmXqWNoIsv9X
	n415VV96TLWVQjZbldjM7AfvCVDOFla/Dg9uBArVx4VzroT6uSq38b4TxqSydoU5k+Q==
X-Gm-Gg: ATEYQzzjA3j7n+5SV/mcQvS3QWLcXqp8OOgZadg+k7v//leMfPf06GjUrk3UdqlHCp8
	5VPZjSo4ZGM0B4OmSStGwAXMJ9pBioKxTkb8bHrpgS5lxYmV6S3+BG+09D+oknVGpAKdZ/W7jbe
	k0Z79d1kZDMJ6H9XJQ/Icsbs8MwPqLVcC5oPMKJ9L4ehMQ8WC2ojhFUcnPINZK1l5Bstj6OEl/R
	LQT+R1WPGrVNSIsgEmyK5Dp2fZmukbaFMzIUbBXDeCJlOAPpmrmidcKTjThkLsDzLgVh6ED8rt3
	M/B74CQN98/yogEnB+JhBIYQwQADzrxF6Ph7rOWYZB9JXL9NPi6iUyaDW0+GfBpY6GrPBAnTcB9
	OPWkBXzrFoqqg4+0uumOaczWoP85WT6q0/H1z687dUW3lhbwE0Ta87EPhbf6PoJY1UjZAWagI6R
	uTeouzH5O5njbu60b96ej5wRgED0Dm6I2BrfE=
X-Received: by 2002:ac8:5814:0:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50ba3994b17mr129652161cf.67.1774801612745;
        Sun, 29 Mar 2026 09:26:52 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50ba3994b17mr129651861cf.67.1774801612278;
        Sun, 29 Mar 2026 09:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd7f3sm1100534e87.23.2026.03.29.09.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:26:51 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
X-Proofpoint-GUID: HaumVkYUmtvXNhxHFhJlk62qn6PGUzUH
X-Proofpoint-ORIG-GUID: HaumVkYUmtvXNhxHFhJlk62qn6PGUzUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOCBTYWx0ZWRfX89V0VXU674is
 YrosLHjwBz5YprzhoAtV9oSa2X9sGqa3qpYW6u0TEf0uA83uW0RPbhctlKLKELKWZYeS2bk3c85
 A3csY0uC3qr/p9nUjDmWBRcKKhnxHI1bkJbUmIRri3ZoSwL49M8UzIxePjapW/Lm/+XFgVWFM++
 LHtf3K+o7+CrbdQf2E7yjHTLw3FgK3BvigSDKtTi71DPLiNPqWOdNdZsAmUosSZ7gj7DNprXrdm
 fIJwO5iT24FglUA4RymYrQp5BevhHaeWrZeT9T/fXJblYiYvQWrpt7ecHpEPjOhYNK4QAg3V1id
 BiZ5w6ggDPnYQWA6s+UcOGNuQ71ceju386Z4EGb9dIFH9fjoBEpMWhslqzdh1KFGaTrEIzCTGpx
 N1eCT+duFOtsGQgSSKG49rHSdpAJhyMbKX71N7hJnL5KnWMf2l2nxBdxuoLvt/cGvbkeXp8HATu
 +tJRF7NM1zjcWyKsJZg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c952cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290128

On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Jeff, to my knowledge this is the best approach that we have to solve
the issue on those devices.

> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

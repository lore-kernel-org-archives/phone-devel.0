Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254DB401A3E
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458916; cv=none; b=V2C7MQ7xXUVQcI/ANsDKD/5g8zqiO/nTUivxuOxemxsNjHHwo0dS4E0olRT17MWN2x0JexuHD+Ue9nWIbT/eEXm7wbY51AbNh7sPScWi9n3ZStBoK0u1Wue20xLZ2cXJnQTenfQDcpZRUkX8OsIkV0XyLFM+86leQPKS3mNyzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458916; c=relaxed/simple;
	bh=uwcLVO/gOjkC3WYajEHlZW3aMp9aoyle84fdStwt6C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giGrxfHqgR8GKUMV2bIJOrBEPjgLXgiAGldd1cNZm/pc0/KfU+dyAfNe25g5HSXKDr6XX8H6sp8HX668A+9SbbwZf3H0X2Hojt6x+udjOeQQ+SIBl8pF7l3tg4jJik33t2CAwaIDw30l8g7l5OXyqJc6Jb5biwzQpNQbowAXEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEBOlUi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea8swqz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEBOlUi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea8swqz4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH7eZ2432173
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxtnUbf8avEpC6Wnx92MUbMm
	n0aJDZVFQp0HMpGDqRE=; b=oEBOlUi5RxHgUWqiMkM9jB976WTJSlN05eouAEJv
	d5ehr5uFb0BUA3pSwd4BaiAWrtaeZHAMdvq26mW+MBl+W/6kmDoRVU5pQ9x5zVqt
	/8fHL7zLxs0MzogHOIxf39CoT2VkZ2fRMlNF+48YZNMA87E1SoDGVoRgNQOspFMP
	t1WGfLRFX+ReGb/Zxnkskgtrn6jYnJiS+HvYge0E1whPiRODGOgHNtVX+y7dm2k4
	znq/AXWWLoIS+88CeLvWNR88n9SC3rqbG0pk6pZY9wEGCXKo2AbqjrYOuJzqG5pk
	P+2r6LUlDon+kT/7IFKynPNL5uwAWdie2g1q5p2QI2qBBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mjus6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 17:15:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so4657491cf.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774458912; x=1775063712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=;
        b=ea8swqz42Ma8csEWzr0MeZ8tSB2A2aoxhrdSO2m/Zy1a6LTBg9Keukk+RxlehRL8c/
         ie2DtuBnCmDCasj5PXnWUZwZYcdsDBouCCE+cuM93Ncnx04I7jC0KR5Nztwc3BvCeY6m
         Z+/NLJFG8wYUwy38+yvjwN4SEmvRf9NS/JNFu3ZUwwEth9Z6xog49tMjqTEGVTYuEc6F
         lNZoL5WmqfIG+oDpnFqbNM4r3ADduDCWnGhOjR7F9Mb4NBOCIS/EbjCFyaTQVBjVucDs
         kB9lske/BFFlVtXVXe7GR4xDZ7kZT0kXz9QziTnmbF9dqK2c8KFs7wHs5x8aC3XdeoH2
         Kolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458912; x=1775063712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=;
        b=guvhzuUBfQ/1LSCSltiTISwr3rSO/Yc8RvZqQtu94jMLEvktjSZ88Id9NjT7JpQopH
         sZ7zrBteU4IYmrOK8woJ5+h8n/vPCbxDDYCf0JhYZL6sp3dUdg5euX6cj1NcOYRAwru6
         8nLlqo6S6emOR1TdmoxT4xq27PKCIMLN9F9LaVTOr7afkqmXFB8eerWXPyT/a8fCfV8X
         mlNo1HJWge2aN6WYR2xxQlgdbNAFMLARzSUIVKS0mMlqamsoqNi7PuHojFsjX2ILYUW7
         Jx0FXrZrrrXKXkvOEuSgyA6OLS7iK3G2rsIo17Wf8nDoZE1Om4SUiIwZ0CgQK8WAMsr8
         VxRw==
X-Forwarded-Encrypted: i=1; AJvYcCUWTscFx+te/b+bEQ+O47+wT2SAs6h6eFCvrph6QJgFtjNH7A+sq0jD6hYkvTNfoCCW0d+4VMQE3iNb6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyDdipeJgQ1D0rQNI69+4DLVoysRmtoBeQy2a2sV2xqy1R2ZB4
	Xty4UI9cp4tEDkFsP649WGaq3zekH6kJjS9KZb2kxdvA3FCc8e88zUQc02z9iJFZ28m4ZwJMmFV
	SPbDh1DbceZHHQyObzZefTbJx7UuYBEZl26P/TQYGyYoOXICdXifdUlxtQPW3OYDxaA==
X-Gm-Gg: ATEYQzwgQHQQr68HmfmLR/S0Mvv6hNt+6kGF9x5Y/4QcaDxTh4TBxW9Ya0kAOtfy5wI
	x5jaI7njfzufHy5cPHUL3G/QTcr+U9n2Waj6Fu71+NH+BO14iop5HjSPdB3Mg1tSsUG575WwlOK
	VAv3clx/uoWne50+dLojJfywZ7tyDZRuzZ9xL7j9gKLbcGqS1KxhSyAOi0qv+hDZQfruII6K1nR
	o/XmoxW2aZp8Hc3Sc5nYk/qliUSFdY20ATo2pRA/TNZOqQCFE7yF8SDk4TU8/pze3oldjiHXROm
	+eOu+0oWzhAx3IRLYlRUTbLa4NM9Vey8Vk3GC0g2pxx1Hn0FBqtGSVbXk5TTapLq4qJXZhK9l0Y
	/78d6tJCCoofQR51apfTk2LQSRTEuY0gOJd4emEI0i1swv3BCheiZcNEoEl+TQfrR+o2178VRuR
	rOEYu1cL6cMugs7rrxEEyJxdm8S/ADBvRhJmo=
X-Received: by 2002:a05:622a:11c7:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b80e32741mr61511601cf.44.1774458912047;
        Wed, 25 Mar 2026 10:15:12 -0700 (PDT)
X-Received: by 2002:a05:622a:11c7:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b80e32741mr61510701cf.44.1774458911390;
        Wed, 25 Mar 2026 10:15:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06a5e90sm25519e87.83.2026.03.25.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:15:10 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:15:08 +0200
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
Subject: Re: [PATCH v3 2/3] ath10k: Introduce a device-tree quirk to skip
 host cap QMI requests
Message-ID: <d6pv62kc5zyqite7krm65vbtlqnsc3v53rlrtilchyk5c7uad2@iu4yaw2ksr65>
References: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v3-2-b163cf7b3c81@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v3-2-b163cf7b3c81@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNCBTYWx0ZWRfX7JzTIIEW+Wwz
 FYhxRzfvhoN57tkI571f309oga4rTdyddNqSi1tmQaQi1ArZLNtLM0CtZ4dzw2l/Z6xbIyRsrDq
 PWsT4BTWZGerdWCv2Mv0xNKJIrEJLX0htGzY7Porv5VU8ensESCmLu8RpdPOfJzJicKWyW/qRLs
 WyMOXWUqCpUGCvRgu5cJGnUpUdrlIBu1OTZgb8SreSzO/TYl29TQeY23ZMzgWUH1XE4VcHQrBWu
 fDhpot9rjR7OOtL2BT/asrS3f7rV1OxuPzf94S8x5/Xj1XRHDqNXspdVxb3N4Npau78dXI5z4A2
 tJps07z/xqlHZ1bis4uzIJ5gHKlHel4xawFRoubSUFfDwRGKV25EIenAaV9a300bRMU/d4whNth
 mFdBZe/R//vDCGjBQAJvTIEPiX+o5ckvFU/7rMextPRtrd9le86yBN53/ANabANZ3POTMobOD0e
 QtYiiXFngu2WQ6HgsKw==
X-Proofpoint-GUID: F31zqYx8-SJiFYQFXGcUMaLmj9Y9OTc2
X-Proofpoint-ORIG-GUID: F31zqYx8-SJiFYQFXGcUMaLmj9Y9OTc2
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c41821 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=2Fa2QF5d3zqJHI2iiAMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250124

On Wed, Mar 25, 2026 at 05:41:13PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> There are firmware versions which do not support host capability QMI
> request. We suspect either the host cap is not implemented or there may
> be firmware specific issues, but apparently there seem to be a generation
> of firmware that has this particular behavior.

It needs to be explicit that this happens _before_ firmware-N.bin and
board-M.bin loading. As such, you can't add a quirk to the firmware.bin
(a standard way to handle firmware issues).

> For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> 
> If we do not skip the host cap QMI request on Poco F1, then we get a
> QMI_ERR_MALFORMED_MSG_V01 error message before loading the firmware in the
> ath10k_qmi_host_cap_send_sync(). This error message is not fatal to the
> firmware nor to the ath10k driver and we can still bring up the WiFi
> services successfully if we just ignore it.
> 
> Hence introducing this device-tree quirk to skip host capability
> QMI request for the devices with firmware versions which do not support
> this feature.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

You are sending the patch, but it misses your SoB.

> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59C430CE3
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674319; cv=none; b=SUCc89zcgH6bUbLaW5wuFgsSyJ1NkWIIZpS9rvNH9fSkScd1cVzagqit+kZY6Dn7a6IYlhY+KV6pXChqG3avNlSG0MeIns/JG/UOvjel3zL6A7pO4C+bze/vpvr6ZwFqU8/Xpb+ArpoeesG6UQ5J/5pNwMpxIWYNgEq37i18tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674319; c=relaxed/simple;
	bh=JrOknWscKHKF6jfjYw8SzYe4PSZVjoyP04yqzjfj/AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBTppaC8KizG11qyB+dfqbaAhMQ71K1GL/XM6FAPSY1WsiiK2fwpzVK8fmbuQpKCUHEjFkq8BzurEcR4DsmwSueFEdXyR5If6eoF/rbm4uq3RadkaxwNEc97vWaV5VSg8ySAHH9JoAFOzQaudD1bUDIctL6QM46xYH/2xKxkIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQh34pTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBz4sCE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQh34pTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBz4sCE7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZP6E3026972
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XS7xhh4HCfCvNxpAVUpkGBU6
	MKSoOMCEQaZdxWSYEO0=; b=MQh34pTK8MRFuRZtdTddPb+jXNkA8+u4M4BSQ0Y9
	iOOyv4AoEzc1rO2Sh3HprdK1WcKGFj/ZAbHy0CLewf2fFZX+TYCevx1URsS2xGZd
	VOQqm4s7JeyJ4PDTD/xgRuPNKeEO/fdqTBWmigArdpCzQq1Eh/lb+olIkPVjomX6
	vemmRo7JFBYUxVi9HmdbJa8yCLZBqsl5umtm0mK66NcYK2PyrBsCQEVvxMriE6Lq
	d7M1SDk01QwHzDCY0/WbcNAN+i+lTyZvlV7eDoKAw+bYQwQlxJeNcfOcgvupP9NB
	wFXYpA06m5a9sose5TbTjBFvZ2GmYDbysrNrtwFnmCNFcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pab8tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:51:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so323312881cf.3
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674316; x=1785279116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XS7xhh4HCfCvNxpAVUpkGBU6MKSoOMCEQaZdxWSYEO0=;
        b=HBz4sCE7/Ml9cDzNL+Ewi57PDfL7Uk2qIDGtthHX3Y2edozlPJglb+brEUil7o1YZz
         Ae3pti8OZgL4EThxcwdzTJLOEj+4b8ORm3yZEOOA0fCs9p5zdPvG29Ml0K8+hsVG8FG3
         Gxm8H5yPhg1VW1fzZ5DaArXV2erZFZnMedWtucK0wby1i1b41vlvKlOLkjezgx2gApLK
         uvGmeUn21/A+r7AeJ4+M6w5EZFoxlfRk8NOi/QMZIvGOSIU46Ife07+rXwd2g4B61Hjd
         L65B2TT8LrBgFzL52rq9VJetRWyFFsqNDj36CQrZKfFyIXpY5H6Wa6ZUFEemcXnbv+ax
         KmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674316; x=1785279116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XS7xhh4HCfCvNxpAVUpkGBU6MKSoOMCEQaZdxWSYEO0=;
        b=i2U/1xV4pXeHg9pAb6TvivV6DXYP59kfkb+tPboZOWGVoA6wM5uva9q8xBjSMC6/2M
         kkR9O4RVWIgEQzsaY6O5bcgL63CJpa9EnplY7nRKaUzdCC4nJM+SHQwBiyWWyydHlZ0e
         Fl/r0ElN7IF3Zv4qZXoWmYXFivM7rxC33j80pnXyCaw5f6SJHtwnCcVDB2+3L5AbjoLr
         ELdDo+wl7Eq8Z4qED56uNKxXeC+eWVtqbx+hYc0NKnKUHgCD4tjp4wuTNJ5uvvXX3BGM
         Uz7Dy1WioOgL+ToKXTIsSSTDmdI1U/yHOfWaIT38QErScQnvlyTADwHacNT4yE0aqqTa
         SHXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2FPdsba+4hh2UIvAu1nTzvzlEnZyIBW5br4ZfGh29D+cyJeHkGuSFJZtEI+jAotXmtIhxZ3wImsLvWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvxyJLiOUEZASxlZHC2eZCuoNaVNubRBvwgXbCRxAErMAB0gr+
	i8FwJQ/7jBOnfTh+s78NNufbwd4JcpEDQ/KKiIXhqnU7gvPvFCh9jPBaPRkQnGRPrv9eHmqaKH9
	sYFO2J0omHK0QQDK3JyukZeBH3GiFx0UAVH39pwmRC5KJkDQTrtkJPjeDY5Eaij2Sjg==
X-Gm-Gg: AfdE7cnoQDjIpCfJyYnikDz5Jct4XO/NV1Nu+loddELXAvTerXS0p2XRWnvcLEjxl+K
	UlB5jQNGzfisyLvIrA2vcQrVRnanvsvcwXYkV+pwswFjzP9LUvAg9gZr1Qltj4AXw5CsulhLBor
	Z/Cg50A8p7/CyqyW+NueAVWp7jmM6EqREUfXO00bs5ln2054LWR33TjLgEiN8z8C8ATqFPcOey0
	P854eke4PE6UUL5F0xoTPH0MlCkpp37kkelPVbwlcCXMaozJ1JoktcZhacwGlOWL5K7OhwLYZk4
	R/5be9NeDRWlnC+TmB9IQwdIs8Mt3FqN0Lp6CW7IVYYMefxa51Zh4tGiblQKKY8/0N8PXON9eF7
	dY8sOt5lILPRdC1FT+XraB6zRPlIyEEHlkihDO91OPLoTdvNr2XLqavdY5HhLzNViuC7vhhdKab
	gavTLrUO2biFITbw==
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr202401431cf.42.1784674316320;
        Tue, 21 Jul 2026 15:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr202401211cf.42.1784674315887;
        Tue, 21 Jul 2026 15:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31c82sm151883e87.41.2026.07.21.15.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:51:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:51:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5
 offsets
Message-ID: <vnqbthpnjfgwm3bsp3lysfhugxfljd3cictjmwvn4kuavytvmt@lwkhsuydhamk>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
X-Proofpoint-GUID: -6hTZ34BYm667bm9jsPIksKQ_3F07rQ3
X-Proofpoint-ORIG-GUID: -6hTZ34BYm667bm9jsPIksKQ_3F07rQ3
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5ff80c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cyArV0-BNq6UFoJ5HPsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX4Mr4+nTp1dqC
 lDDq45LxasFcA9pVLe128DI1//zyTBV6W/g9ngLiD1HTrpRK2LS8KReUgDGQEYyJylcQKpjoZ4z
 ZBFOGHUOrIEza9lVmy/XI+AhREgBy9uYF0et7/rfdX91Q4vMBhVkBPMrnRJeJYn9xgz8wbUzWLU
 ODup+NSa7I53G6y5C71b+Rh9O1+VeCBC7UbVMqgsm0Z2fCaF08fojDaZf4AMjeqLiZ1LIlhlvnE
 Sl9vGvNMFgCZLcrgzwEpTSlNUlTWYqUZw9eWYyDsaTZW4Jd7miFI4mybAzMk1oxznp1SdZuV4al
 2bkfQvKAFA+JzKEFSj7FTPXXEtnE/BHWqCJW8codjIs9fzStj9KHTS6+cFW5HkkkLM9XF7Ja8Wb
 9JJhPebK4Ku/o9KwhdLPREAIGYAXWJVSq0/lbzyiIfjw0BvdRsGFCjrgLzT+6GafZfzZaRNPZG9
 3x2b1BD3JX/bMatm4Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX8eO/KNVXaiUS
 DnINHD8oGcy1PYPPkRTHvR6m7AQWge5PlUK9KfxrDc8q/Xqq3Ytzqn9GRbBIUKEHHWGwZ+lWG7j
 HXYgepbuDBd26pjUGw69dXKFxBntZKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210236

On Wed, Jul 15, 2026 at 02:37:47AM -0400, Esteban Urrutia wrote:
> Some SoCs such as SM8475 write data to registers using this offset,
> specifically SW_CTRL2 and MX_CTRL2.
> Add pcs_lane1 offset to V5 offsets to support this.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Fixes: 0fd0b31965b0 ("phy: qualcomm: qmp-pcie: add support for SAR2130P")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

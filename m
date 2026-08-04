Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A339D6C9
	for <phone-devel@vger.kernel.org>; Tue,  4 Aug 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886701; cv=none; b=Bb/6I2gGUKOVL0ubtz3tM70xfIEbGu3FrUP1VZlbM7aM2CyEOzTnBQV4HLWIEOaVkXvLA+86l1xYrOprMlB0pHqg5H39jTwT69KjfMGUVjfzMQ3swi2kIzQqvOofcZmaaPa8miHbA4vvPqeXXSTbAunXRcZUs6fdai7Lai5v/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886701; c=relaxed/simple;
	bh=FunpkaXtNrX8UEfuOjGUq+jQa3LfT2f4TXRe05piSuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKOJLXk3cPV7fvJ9SwFqofUDtNGM2mqmWGnbxsvjJMQDFzc3oawQbdtup7dDu1tGEVNLrtfGKg5+y6ZWoSdKL70IXUChrIJunKlM7frtnmLyzWURUsSmozdWQE9hzkrHVuZb1mdEuKDP3yB/9OaPYQ9Hz/quF9upGog/pS3SnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtfKplyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYnyO5Bo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtfKplyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYnyO5Bo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NGnZw1090216
	for <phone-devel@vger.kernel.org>; Tue, 4 Aug 2026 23:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tCK3SPQ5zchCrYz2NKkSth5I
	odtFQPccsfX2kI83AMI=; b=mtfKplyQITFzqsT8gyatEHQFQypJkOTxkJyZH9Vr
	EXpZygOHC45PxKrUA1Zr4I+OHatWhvffLnhT5sivFXGC+BVsIHyVCn82oceSG20D
	1SZ7/Q5fMzReMtdyhviNyec2ZJVFZBJ2R+Sm/7/8j1jw3gRxJO+xU34iw66FI/uZ
	RUm9tTz/iuJ/VOtRfQiow/MHWa3tMm3kVm3SGYKOCnyPi33Ym5YWzp6OczzZJcGS
	gL68lRi+yNAZDzBKmGI3MygEitEXfCLbbn3lOXSmuRKq1r+1h3QxTEvRWyENvwoo
	grZDCfmd+vJk43cEIeoTa9mscDy4BHDn8Km+r0SIr/gswQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nsjun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 04 Aug 2026 23:38:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso6069081cf.0
        for <phone-devel@vger.kernel.org>; Tue, 04 Aug 2026 16:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785886693; x=1786491493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCK3SPQ5zchCrYz2NKkSth5IodtFQPccsfX2kI83AMI=;
        b=SYnyO5BoE9XLRZP8KnadCG+DttyBxKBGpGrnjg0y8utcYc8kXFJOe207JhsNuCHk5H
         TmgZSqA+QaKvqeSDocX7GEYhv6C38B9AJ15PkRhjSgjAo/clwiMXqi7wFSpbYaWGwEL0
         yOesTJG4YoaEu1JdhAtf4x2K62HPW1AG63S4/wKojwQpB7DG8M6xX8X0eOB6uZrDcEQv
         jj4tl16TZ5gk2xL6S6rIWvubPHXAeKdeHkyF4thcyg/LzzlTA0iKfeJAVzLHx/rdVB8l
         eB367FMnNlsvPm/Znf5jh9gHTxfPTxLktmpMSXdazAUXdhzK6Hg/4oHv08hAvCfzxcpL
         Xwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886693; x=1786491493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCK3SPQ5zchCrYz2NKkSth5IodtFQPccsfX2kI83AMI=;
        b=Qx6nbuK5FAAhdmgP1//k6qMStV42akaBrXd2bSrwMYm1Q1LSyYAXgquxy9gCdA3ips
         Z4y+EojVbCdbegURRa4dI5ryfC7wDdSi6vxWUcvNKlC50JvS/YMUWZcT7tNl3U3MD/Jy
         VHTv9J8Wj8njahACxgd91FhL1xsu4PG8ACk+qYq0lu15gGR37qMtSI8iFZnK6BDyCiSB
         PEmaV8glkkAAyA23B1r+bARfshzgZGvqwBU2e+BkDboxvx4okZiWAevH7eL8/7ZD8n1A
         aj8gxpn9fT3lsePiDwZUg3Eh6XPLzR3NtqnlzMviOlmk05c13yeDxwOigWMMwpgpA8rW
         sh2Q==
X-Forwarded-Encrypted: i=1; AHgh+RotD6KXcaVZeGB98ZjD08v4uGldVBMbx8PQThk727Hjh/aB8IOsbzt7MkUgRnLp0nxMDy2lx5ejkqkoGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIl7eoAgE2K1W4Fag2gCzFl4qHMhnwERSFKEYbFDWlOP1KkeUp
	dzWNEoctwTT2FElPLLE4CYYEgAViMRtMVEm5zwdIl6w+tOw4UebmJgqdj37DbDZyzXc62eg57vQ
	txhUItXAVI36kOlULh4wtI+6azAGLa07l9eO1sEDY9Qe5I1x+22ekIu3uMXtmCuL8Ow==
X-Gm-Gg: AR+sD10vJOIrZ9322rcLmpms231zGWs5Z3jaWzRze397ajAQMkXTRWdDq0crkYzT8ej
	Ls2Fwwa7NSY53tBCyO+x3tS+cc7kND0EA9kwJjzz2NLeiwsWUPkRZpyiVxUli9lkzhY/qtBOaLj
	eiSNp57s+2ld0HYp0CMlOsFX+Yvi8/NO9cQwNwDdgmjl1F6qhwHxajjcpSFnO/PTxPEGqYJ+OzA
	K1qvbwXbsCDGm3gxE5UpISDrAevxaV3MFIq1ZCQlNfJqV4Kb2nfhSHtBlIXbsvn4Zn4NqQfDhNP
	6cvNuCu9as/zg6nO8zto1be2x0I64l7FGQQiLCCOOMX10r39GJ5iXOP3ZPEylqKcRFiD73aeL7E
	NiO3AVjQ5M9RvEz9ChYetYTl6ApiFcwAP+q/TroeUihkIMJlZvAxjTG3tWAzMxnxyVRs0418zwd
	qDpssLgIsvxItAzw==
X-Received: by 2002:a05:622a:1f97:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52ce5fd907cmr36958181cf.12.1785886693176;
        Tue, 04 Aug 2026 16:38:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52ce5fd907cmr36956931cf.12.1785886691570;
        Tue, 04 Aug 2026 16:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb98eeb78sm3134401fa.14.2026.08.04.16.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:38:10 -0700 (PDT)
Date: Wed, 5 Aug 2026 02:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <ikg6rz34bs2exae2ew6zrsnvpb4lsno6ugym3e3uxkiv7gi3ah@wogybp7c2uu7>
References: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
 <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX0MAKdvjj7q+a
 xNA8i7pIWjL1rEH67hxDBhsp8h500cO5l3fXTh30aHmKueTnjtSvNPxO1vhFHVEUPJhD753c/t4
 q7s2bGzPUCF1P/IWVeMsmvLkZpGJlok1ccDj5M/aN/rqW/DD5oDTIJIluiZXpl79XMBvf7hjBJs
 t9RsExFtW+mC8O1RcgJMVPHEaAcCboCFY1e0FKS+JshH7az6Ks3v/TWFeKzTLPEZ7fcD6F/xj+s
 tEBnoE9Tk0b7Npmqyg9rKh7RqkZaZn/A1UuS671QR7r8IWbtMgC9QbPhBKruLevLyfoqmEOoM3m
 MfxDBaJD50VTCd9ZuYSDts9x8i0AuokWTLBt+2iPmH66iECL7+gDVVkM3qc1Z0rV1PQZhKlKsNk
 +6BemqoAjzW9w+htDvAFZdeoV8RWnn/nB1SKvd9mHWPKsKYqOSdOrBhSGNPC/tSCjRlUz268e/Y
 Gd3zdS0SfhAJv/Y/eAQ==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a7277ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0cGqrpNjlybS6BQeJRMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: eiTvcgqN1NCCISjVmrd_h21HLS4ZL06q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX6gWHBerEEJIV
 j0wM9Lbm5xVKoHQLbKRH3WiX0xP8zlFhCWWVWkIRD6CJNELdPhTg1Ov0iiDh9WsDHbI4PvbrrM5
 W8rhh66T0tk01MPRIsqLvX+zy1/hpMU=
X-Proofpoint-GUID: eiTvcgqN1NCCISjVmrd_h21HLS4ZL06q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040192

On Tue, Aug 04, 2026 at 02:06:20PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Has been tested with the following capabilities:
> - USB Type-C at 10Gb/s
> - DP Alt Mode, using HBR2
> - USB Type-C at 480Mb/s + DP Alt Mode, using HBR2
> 
> RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
> reused from other SoCs.
> 
> Some SoCs such as SAR2130P, SM7550, SM7635 and SM8475 use 4nm-v1 PLLs.
> For SM8475, trying to use qmp_v6_dp_serdes_tbl structs (which are for
> 4nm-v1.1 PLLs) causes link training to fail because of ref clock
> differences, which in turn makes these structs differ.
> Add structs for v1 PLLs as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

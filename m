Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAE3FDC00
	for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727423; cv=none; b=BGYVKFGo7LOY0FM+JlNcdhgT1xk6kOzXyAlA+0L1Rqq8Dly9Jd9GDguzeh2CF5y+Hx6bry/HjzelqAm2vWc/OoJaV9NAx7t+5W+bodd/ZueemEyGhnjrZGgJj3+Y/F/BVs+8Ioawo3LGT1R4dkImm8ft3/YlQkaBtzreTtU50TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727423; c=relaxed/simple;
	bh=4hEbbYpzi6ELOu6WWiNKsm97Qe7N5Zo4LC0qjRTpqiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvRHwOVi2r/ST+BN2DwxDDYXr6OhrNWG0wokPSTo1G+5A77LHlfL24r2Jv45hQmdbzEKyQakKveheRD+KbOrnk1Brw5KylP2pXvhQZSbwhjknuWw35ZcGMhzsXnbSFj0gFKCVO27XBno/Wh6RrUAXZd7C4N12YlK8NUJMRRxams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsP5MDk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pt3mzhpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsP5MDk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pt3mzhpz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OY8N2349380
	for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 10:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYHNWcfl+oUcCDN6S/9Tc9R1TgjQaE4yesMb6v+V/Qc=; b=GsP5MDk0mqHQMzqj
	N9852vyZKCbZIehNPASb9xBdchuJObEM5NdxqOgwSw5ATSuvVXbR+ogtNdsFpbTT
	oYMk35j4nYHgQGiCVw28/H5USPQ400fnMTT9hCusy9lHHQ7UeDuCAWnuaBBFarY7
	8qIRGvTMFpKpzCIzKcULapv+h5wyv2iqsjbGVfj9STEqBwkszIIx7qFmUAcWEFvW
	J0orUNGfr/8+ZsIDciYFmmj/KscDNx17HflWmyhe/JnZG59k9J/gvNMbKcq5Jkb6
	KTDnf+bUJOhkYMGBCno7zS2Ifw1b6DrKcRuQk4gS3kpOUTar8QfZn+sM/32zeeK7
	N+HXNA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0ec1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 10:03:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so231156137.3
        for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727420; x=1783332220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYHNWcfl+oUcCDN6S/9Tc9R1TgjQaE4yesMb6v+V/Qc=;
        b=Pt3mzhpzaIHBIJ1J//D7N474/zjVdYp2VCFYKCm+DpbhjFYPLVwgYQ3PUG7oIRazuM
         6V1Dj3oFj2uy+NF7/dYi5y+gVVWq9PD00jp/Fi0LMjgzGrox5lHJSYpJjRpk5/6sqY+1
         moJBwvHovcYFZaLZDAMwO978hGdiKsoVN1w8TIYu4hjwRNV8hYceRR0SdbEynm07d2Vv
         QEnqWoO4Q4GMQjFN3RQiRd/p13ZovE3FpSAqL7he67dXVSXz7BNC1h1rZsQGs2IlOJAm
         9MCnPcRkRwqbGeyFKS9/GX97IvNuXxb4UC/wSt9HTjtMPJMtTNcHAT/PhHUCILSasrZx
         VOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727420; x=1783332220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYHNWcfl+oUcCDN6S/9Tc9R1TgjQaE4yesMb6v+V/Qc=;
        b=Mv+HMtWuXvuGrFks1rYIYZo8yWdrf2X8m6QujL6F+vRU/lLJlQrznNUj3NBs9jgTkS
         1YGy/DyeUD2+SuGWZf6+Q6OYrc1pHjyNxBjrktPHx6Ktu9f6OGNRwDR2Ie7EcBoVqKDi
         JLRh4+qTTJO0H7exhrw7E3LZCAAcsv/1Zl3Hnj0fLD7CCSKnpYfitX2s766mXIi32aAM
         saEEnH2MgHDbs7yiODMI81l2hd/oqjFQq34FxMuGdCJgATwBIO194Af8mSLiec4HOLr3
         IsVhVUtZ4Dalhjm3y45n25jVNZ/FCkcQ8/4i7U8fSX29G6bYSJPPQThoHbaFVT1bOn/O
         F8TQ==
X-Forwarded-Encrypted: i=1; AHgh+RoX36X1k6Oot8JlJfFwH/yYZAKclkEOoDm2KdVIuZdjHizMva4m9VgkpOJMXHxfU4MLJEn0CORUqdhF/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJnqA4UZ1h5kkVuwaw90TahAG0t1SpAUc6pFuiR3+zjkldHpGb
	8Ej2XznsIkQdfyS1LudxNwh+edvWHX3581By5mLzrhm8QVdkUXQMS0d/xXSTaq7Qa5jB2ypHMgW
	Ilp8zDU6c8wPXp5PBjOs7uUK/oikLCCZ949a7OGn64to/iHl7yTV0dxJOA9EtmoWXNw==
X-Gm-Gg: AfdE7cms5RnRhBHU6ZY9VHU6ur60+1BlBN0CELEf6JsuwNdQR6kf7RQFAekw+ZAIMny
	CdItbhYUxPQBSGaB+oOBxOz/zIXAgBiHqfqUiS2WBLtzpkl408/E5Zf6kneWsX+R/7XJE3uRfV3
	o2jcdSD0969pEgGRThxe+kayzf5plW64jPKO0HKUsXvGy2B0dJdC+GLOAkgSewyh//fVHe52w6r
	GRNgfSkwLmKalCbmlXPvGr/YpGfY+fZjSJD+bziSWOa7oCblZ93tY5zPL4lirawlfSS4I4T7hGL
	/przCDGD84OAts1S+taO3VxFn/gdxAd4Zn3aIL+fg4HR4TDRl35MLhPzteAPEn67K4EIrv17RgD
	lfvQgafIxH7kXBRYGFiTRL/jGvNTVyWV6PLA=
X-Received: by 2002:ac5:c84e:0:b0:575:b506:43cd with SMTP id 71dfb90a1353d-5bd912ea4ddmr712004e0c.1.1782727420546;
        Mon, 29 Jun 2026 03:03:40 -0700 (PDT)
X-Received: by 2002:ac5:c84e:0:b0:575:b506:43cd with SMTP id 71dfb90a1353d-5bd912ea4ddmr711997e0c.1.1782727420123;
        Mon, 29 Jun 2026 03:03:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6985f30fb31sm2132833a12.21.2026.06.29.03.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:03:38 -0700 (PDT)
Message-ID: <1efac6e5-b4af-4c48-94a8-5e55cee0a864@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:03:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm/mdss: keep mdp1-mem interconnect alive during
 suspend on SDM845
To: me@samcday.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX7oCBsAXRi3R2
 cUAK1GzNS5TkFsmz/kTGEwCQGnGRx2XkNaZCwZ00trVaX1lvH2PQssNgZ3qn2h1cIf0Pjjwk13L
 GuMis/0/BbMOfftW31FTdEnFndIuPlU=
X-Proofpoint-ORIG-GUID: NAuuo6BL1RgPf1Ob0iy8pMf3Ax6mPz_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX20X+lFZtByFa
 bd278x6qw/8khoB5KDvUgi99xiRTk4ymUW4wZU54LjsN3liiGKL8RJe/x4mJMRV2H8Z+821CBQd
 zKZqDGH81ObGRIBlEZX57stVWM1VjRlScoFTZ16VK48p5FyyWaIEKxcJTPOvy5GbcVNKU1CxB5R
 C4engu5ObLQA0Mj0GgN926PMz5XslsXMh2J4ngS/rORRTH/pHDyirynhK0eAvPKw+uGfcnp/pwR
 8JNvMfkqR4cSiMZwiNgo2Jr7at6D/R4uvBcIY+aSfIparvgWmz5e2P6y/rSV6BKHnZ350dobo2F
 xu6JyqQ96a/FQG41xVbOjBasamJidSkZhWbWq75CxgsQ2Fe3Ke3D0s6hhnUMQnUzSxT+3nml+G6
 RfMQLVM8P+QnSyoXi+GIj7SKbEi2lnOlpn3ejUnKJ2kKmP2qiUT+UlIuu//team5EVXhFLHfZri
 PFj3OTkUOdv2xoiElmw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4242fd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=lKQ-AihTAAAA:8 a=R-HWJY1cPxioPo3k6UQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-GUID: NAuuo6BL1RgPf1Ob0iy8pMf3Ax6mPz_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290081

On 6/27/26 2:18 PM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> If the peak vote for mdp1-mem is allowed to drop to zero, it seems to
> cause the fabric to collapse that path entirely, which causes the device
> to bus stall and fatally reset.

Which fabric? MMSS_NOC?

Can you experiment with setting keepalive = true/false on bcm_mmX
in drivers/interconnect/qcom/sdm845.c?

Konrad

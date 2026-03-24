Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE2235AC0F
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391044; cv=none; b=QGBugDuyuYkS7q+Os58nKFdXE67UmAqUgcg7WaICDzmm2vpX4FQ52zXLDO+bP/7jqP+oKBbOLS34Cn9xN5HcbRrSWgD6QNZz0Lc+GzvfWzANoWssg3v3FQFf4clMVQ4HEzsumBwMYpoSqzuvkgyMsKm3Igz4zfNk86p01ZXEOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391044; c=relaxed/simple;
	bh=N1tKpnex4oilrEsmQihojd2Y4bKB8LOuOcsMPkqHzEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxMBG+qln5flkuZ880wsHPyC4IwrrhSCkQAd9pV0ldB6m6PXdXjOsU6HPSXFYgt006t/xCcf1q0uyF9LZqcea5xkLQOu8A8aygg2wFOgh7qT42f9oGGSYrG2yI+Bv/O6sGnK6GLTQ0AoxfWAVWS+N7bsEyF//K2cE/L/PStPW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt1sMeAv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ko+LEu6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt1sMeAv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ko+LEu6I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCsXZ104366
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQ64CWnoxSzy7MVIuAvuzLD3
	ASs8pn6BQBkngtvjFrs=; b=Lt1sMeAv2/1LY0Ttgv+L62rn4OA3bFljZY8lrfXO
	Is+7oh5YtvCDM3fGXFjPPjuiPJ1FKRA5cbsfT+9fGsUXKEVlRAJQu5EXbUj3QJmo
	JMgnCVqNDhlcOM9dye4+S2zXf7Q94xNrQMviqLI+S+MoQ5V8gb6gr4zMtkC52NJE
	fXCw4djfeiLVPA0uyOeZsZdaIjcwbfkOnubp57rFcsB+4NCH0X1GXjJtGJTjREwy
	9OpYP2JNsFulqDlXl9xjNsHObn1Tra9f1NaUEAAPhao6z7Nw8+vOP81k6ty/DQJH
	TnBK8ykLn01tfjxcLT5Rvb9gXNQqzi1t4tMwwtQYtOdzaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0jptg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:24:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso118834611cf.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 15:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391042; x=1774995842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ64CWnoxSzy7MVIuAvuzLD3ASs8pn6BQBkngtvjFrs=;
        b=Ko+LEu6I6Hx6U8ECw1BYL9046XshW/MPlXSXq1x6Ux+d7UaaKEh6qJuQP82OJ5olzw
         0BVutbgh5wBjauQmhyZcoNSpwEHvNIoqXE2/E//2ZrjwoEYkl3z/Oj2i/djAprQ22Tje
         8oZCsDQIftveEqMHoj5AQbk9P3NKxe0q0+mtaRRZgVBIzbLLP8c5arWow8yigC/xhOdA
         2CloMGlvinQQefy70OJadb50mLzl/b9CU3gh1cuvvdF29EUrwLaOcA9Egu6pHWGUUFeo
         d4kOgtoubKRTHGnQYxeUbniIaFPSd1Gz7xVZ7lS3AZNBq5NWMiUNRMNxKw4zWuO1oUGI
         X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391042; x=1774995842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ64CWnoxSzy7MVIuAvuzLD3ASs8pn6BQBkngtvjFrs=;
        b=rFhKEI0vnYzsaz06grliH5C4iKwusvNXbR3SxAbgtVnXM0OArJQqgHzx+Qg/jSyFCf
         Me6I7ym/WgRsq/eacflDPJ7Vrj502ro6gLWgNrWKvC1qjuoiT8RsHo4Nn83BtRnOPCUx
         9QPZAHfM1jA4a5RDVSlMc+dm0utFvqa6BcmE0/hpHE5wzZWHxuCyN7CDT/A0W7w2Dec4
         5DhifRAD4gvXiS4jF3SD3JinRQKW61q6zpwW9qPPpYYdruQg69aHAxfguTdbM/zEL1bX
         vfrvCPFzUeOcWTXFJt50xkN7DyRVKtWVJ+yEY/sqfs1/x/QfFG4/Y2LCDEaLW/FyMr/M
         EfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwqor+xPBojqjk3ASuU+ru7PhbBt6NMmmgOUiI7GKtZUUo6e05R+cj/ZJttT9Trg+I/MY/PhT+dOC/HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxN36b+0M370pfKfJ/OpAXoPBNNrw4kMkBAWsUoV2qbbik8Zhs
	9Qnt9S6llvgElwRKOoZAbpw3SbwOI7v5t8cPjaHmzGGBUBQts9mU/KgVKrWdcFNUOhaEamGuh01
	Qoh0vxQSgjP0HIAPOe6OOmxnVj0QHEOOkAH/9gQsnSIPEhzcBRfQ3/CqTgkbMpVIeeQ==
X-Gm-Gg: ATEYQzywri2M4zhQjgnoC2uUuH31htutdty+Lc/bQSn1gZDSRlAVUpOvNgEbLVfxDG/
	/6IJWG+UG3RwCXR1RG5XdBigsISwp97yksnOMQjG9HJyrylMRRrBsfLWrsA8l2P8Jw/Tpe60ACX
	LRe5rjuYMO68fZ4bWrOQAW7h5PBv4CLWSyFXTv5qfOPmVPSmICQfvvTqqKGLN2yqXOgpQ7f6Y37
	BH0mUHlJlTGKCPuQlWO0HbtCLatvCEs1k90mFF84LTdFOuEpLRZ2i4nrI0oiioiJcC9jb8rmGtk
	uqH+rOE5R+ieFmy2HgDemWotiAqnxy5jfytdesios1XowJbepc2W43mN6ksFhV+VntLD/s6cNZU
	cyfNgy+PQ4v8vczyTmHnBieIWJfapSsXvXtjScHlArzunSrmeaGf8gC2/+4dzArAqpAslFZ43AM
	fU9tJWtNmp3tPuXf9gyAn5QlbfdENrjJwWFOA=
X-Received: by 2002:a05:622a:9db:20b0:509:d76:fe5f with SMTP id d75a77b69052e-50b80d24615mr17099231cf.17.1774391042004;
        Tue, 24 Mar 2026 15:24:02 -0700 (PDT)
X-Received: by 2002:a05:622a:9db:20b0:509:d76:fe5f with SMTP id d75a77b69052e-50b80d24615mr17098901cf.17.1774391041460;
        Tue, 24 Mar 2026 15:24:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207393sm3518042e87.50.2026.03.24.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:24:00 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 13/15] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
Message-ID: <5hmynjbeful6ovl6phytya3hpbytrghtpfoi2gq6gatg2diz4x@j7fouhrrb4wx>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfX67leY7qApokf
 5ZfmUiWwwq/l+xUqgph9dryOAG0QLI/o1YBugE8EO3LXbZM3xK7y3SzOG+gly4hK3n0+5paTtV7
 wvH3o4akIhTEY7b4ywlk2g7TN/l7/SenWWi8XIJ4itGlwVB2fBvP/ZRIKMEBFi5xZLi25u+hYHY
 1bQBzSmvlEbx4Hsk3pvqu9hY8qMTlsfQ1tIfPRwHC3HHb7RltX7lyFzCVNcp2dhQlijzMxrJu/W
 RpOdVBOT2CheX4Sin2bg7HFE5aEmQ6VZuq4QHCDsyqh8qv3HdHeR7XSXLHiN7YvNpcpuO2wvsMP
 CShKlk0VKcxZTtcnkO2bAeipj1vo6iHv98XfkWOqHIGv5kCSfistE1f2rVb99YBca0FKUqloH+U
 +RvXldBXggqc4aLPkg+4hzC1hWJGmhoDA0TLYaWu7LhF/rif3YmwLnscNFS+y8F8dMYeJ/Q36pk
 HtBo0Nb9FUfkKh/CTQg==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c30f02 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=Kt3gK3lm-ZoS_3LmuawA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: WJgw0lg2NyyqD52v_PSYw49AGxAdyiX2
X-Proofpoint-GUID: WJgw0lg2NyyqD52v_PSYw49AGxAdyiX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172

On Mon, Mar 23, 2026 at 07:41:41PM -0700, Paul Sajna wrote:
> The modem firmware for this device doesn't preload the IPA firmware
> and requires the OS handles that instead. Set qcom,gsi-loader = "self"
> to reflect that.
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

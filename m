Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838AE2DF3CC
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645621; cv=none; b=XQVDIDA3ROX7NRAM31TaI+GJ17uGT629vexbwBuL+pbGDx1TytCsW0IM2foRfViRbRGnuFpdCSJh2NGm3/py2qDenDtkfF1TDIdlgGBHFff8lDd9tKvcjZRMncwfyHrHBJRSa5Ma4RBrags5EZhQxWKujwDC4oe97mmHbfaSEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645621; c=relaxed/simple;
	bh=O7HvVyjJWh1+92gHAyUFdd6vnnoG1EgYJyiOAiUnPK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvmqksZJyN9As67iMu1I/1C++VRypZy8SU79xCCdNeYh72gV7pZK3eIN/wdnC7wFDOppKXdzZaP2Zvmd/rv3u9gQNZaoT+H+y8vD8NdjOYlR/TNn6jVUEones5GczuhiyXgniwlln+5INXjpBUvmFNyq9Zk5oTTtbdpoeGWLy6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HY3ukzu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY3ukzu+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GBPYdr022317
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BVqwkBK7C+4usBpdqeZOce1X
	iXkyQyUXbdkjEjS/bvA=; b=HY3ukzu+mNfhq+d/Pav+sgGVuIBjQ2C0Xa5fFe4m
	RoVC2bd+U7S7UezPZ+2AeaAstaYXsDQM0yhWD8nM3fxwMhGP+nb6zOrYt4PNrjaU
	pLYvuQqICD6pu6gLAajfBAX41NUM9t6yrlBTHWdLs5cCyo6PbYrCWurmgInHZRdB
	ThVV6saOvhr1g3uzrrYXu2hsi0j4zbiTkDgby0JX6GbojHGsMxNTAvw+2U+uezM1
	oM4Pz0mgkR3/gkBtyJFMTs2FeX7Kwgi/wk6cP4UhzS1TVF358V4+P2R+xR6RmeA0
	2eQf8/JcjdyAqfUngA4CUyPqLWZctf2TGVWvXkpYEq/Y5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpk0cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:13:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85dd8633b1bso895229285a.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 13:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645616; x=1761250416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVqwkBK7C+4usBpdqeZOce1XiXkyQyUXbdkjEjS/bvA=;
        b=n04EkNoWtb0f1ei/sbT77o9Z5o/HHyB1pn1oKqoypWk4Nw4KnIzsYVMsGt3CukL+Fg
         9N4y+IBKH8PyUrhKB7XtkbyoqbZmxCK1kJUQiHY2RShMKM8x21QGfULz+QmKAm94SNmo
         XRIv7JXCYh7clTMWZaENRtTOgJ6bB1Xp7RA+TFmrrlQAI3QOteV4fymb3nOZIEA6c5AD
         JNkPbWrqLE/muBy2KBHksMvr1mKviY8MJ26xOcdH55TWCwJOFQsU0sLM8Yygh1VaIMnQ
         SJW5rjCd3WGhsE3uSQofmWTrEQ6Bw6IyZ3H2VtKK4oYHDRWYzD3UBSvKX1I+Uz8Hzj+e
         2ucw==
X-Forwarded-Encrypted: i=1; AJvYcCWBu4JtZyRmk2/dyNV0oNa99I+U4hfPF1htsbVA0NJjSND6dSYZU1PHMlqqURX4IEju29wdeMLD3KTnSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLkcTbmNH0VcNQibbq4IzDMFXt/o3aysnaXsevqVxzYBNKl7X
	6g8XIJ5evWzD9APJfHbcRjVKlKFh+i0DtELnynU6dEsgeiYH2+NPjsoZpYTMdk+BjiUVSS6y8a2
	jKtxeBsLh1kaveWEqYt3KoHy8UJvDfF7T6XMvIFTdIcRCXy8x9/ktKeGCYmn8aV7bLw==
X-Gm-Gg: ASbGncum0z5KUsgqAXI2oZlgu2A/QjWmVLoUWNTVKl7wuwLXHrV+q9jwyjA/ZaNt5nM
	q8qWb8i1kF2EyLR/+y+l+9euwdTN0cIZHOh3Vsku8s8jZdVAhe+uFYiFO2LCPBwgH5oevrJYz0h
	VvDMnPJ1FNo55IxSLxmK9bwTfwRDlJT7z7C3a6kHWJh5Cyk4j1a88wHKoikg/DWUplZrSvbLtrW
	H8owpy8rsFrB3MWAx9KbC0cIzQH4VMYA16DNfjwv0sQGlV+tAawvzR3aaXXBHtufbS6mI7HafOb
	yRIVrwov49Que/kLLQEAFAyJ9YcPQYWdAsglPNQXWR/uOr0qF6ZHCHmI89lP3hGEpEmXhK2owtE
	xsxzjb2UYwiCLWyfoq06h9Aqi4PTf8NQxZkI9VBso9dhhdf+C+LkJMNcxPJbUe98PoKgRCAMtoL
	dNeRisYL0Fyx4=
X-Received: by 2002:ac8:5790:0:b0:4d5:eedd:688d with SMTP id d75a77b69052e-4e890fdfa5amr71048601cf.30.1760645616401;
        Thu, 16 Oct 2025 13:13:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGdezOd1qF+LssL/Y7iPaJQpkE4Smw0fe36efmwylumTn5FP8jrXp4xfot/RsukELYTcXfw==
X-Received: by 2002:ac8:5790:0:b0:4d5:eedd:688d with SMTP id d75a77b69052e-4e890fdfa5amr71048241cf.30.1760645615972;
        Thu, 16 Oct 2025 13:13:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563a48sm7309026e87.83.2025.10.16.13.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:13:35 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:13:33 +0300
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
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Message-ID: <f5guyszcggcjnsp52uwexw3gfbcb5vakpydcr2g5blpblsgg44@qzx23rn6ycco>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f151f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WaRAvzN972V7znxJzTQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX7G4GM9zXXFcV
 JNxwliJvqxQzqgRhTw5oIOUfms1e/d4BBJcJehLecedF1qvnUAS8UDKCEpimtpIoQXz+XKM4KrL
 nrMFghvZ5qxRXSYHMSDBUjOY8JDOJTsoyAaBRotUc7csqf59JXA5Hm9MOq+iLlS1cckQ3xmv+Uz
 CSsHALX2PSbEA2V6R7S8o7NijLrJMPDEGHqhXHhIDloc4n84nsRcsZC5rkQ9qAKEAmOs9TmYM1k
 lLR4rZdxlks2l4okB1X0SJwroPrgIr2ACw6c9N0qK95hlXQ4zJ6fhQgAd30GWK8MD384pyYtgJj
 vNl37pgxiNEk83SNAhVwgGsZxgLtw/gjqVRkx/4T7WTL11KaEv6o+pvDmwRhPkBtWUDMzhOtaPg
 nlCnbWGVvtJz7/VhFwtgWIo3V7EWug==
X-Proofpoint-ORIG-GUID: o-Z477TOVur0z06J5fZp3BEeubRvXIzb
X-Proofpoint-GUID: o-Z477TOVur0z06J5fZp3BEeubRvXIzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

On Thu, Oct 16, 2025 at 06:17:01PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We can DSI pin from 8mA to 2mA while suspend, do it.
> 
> In theory, should give us extra 2 hours of idle battery life.
> 
> cosmetic: sort pinctrl properties.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

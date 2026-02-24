Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879437106A
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926784; cv=none; b=cistY4cK/SdniaziXFbRonczJL5uO5fOEtGa5A8b/bNo/ezHYUhg05kt9Vdng9vkU+FymgdXPfhbh0iMWeBcTBsibd5gl8+bQxkvWoOqW6Vau+xU1ldxa3nQo3eJql9s8dKSNWU/GGLxjM3grOZ1R0JUNk/KFZXIWnOyObWRVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926784; c=relaxed/simple;
	bh=xhkpng1n6YmbsIQQvz9aqEU1lB+NHPH1lnGC88a17Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5DnxUJ0nWdEGM6ai5r7JrBstNyWXDn2sQglaBz6lEfjNYULU5uG8ZD0G9vUVslu73JZ91UJVG2dHXbpsXjhircoNwtNfnR9aGI0ZnaSJfVceZMRVu5QVnXJx+NXPDHjMHSXd2IOTEEG3rFHriPDghZ7yMQu649DxSEzysf8CDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpzVIVFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3d5nrXh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpzVIVFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3d5nrXh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4Li8L2808544
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 09:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u828qxpVVFzxepP9ptP2nkRL
	eZRVHAa0CaoMHz2ebqQ=; b=JpzVIVFlIcNgr8a4lRjWRfp2t/Oa1LG5qYeNOKBu
	z7CiUqu8dL8Bk4qtV1XuSW5Pe4wlISiC1pVOrOd1PeJ4BJdeJDhwooFaQPCvJ7D4
	IV+K8pPZ/9p64+gM7OJODcsEVYaiITjSa9F1d2IojjlODCHTM/zNlWW0vUltrZDK
	Ej6QHjJr/1o0U7cGwMXOKnyoN8e8NJ1D/iq/Mo1jagd38qi63qkOFwR+TnINg7r/
	rAUXK3G7o827ZJEkx59quZYYqpFf2K5y0jwPXAHJAGa5NSZxDLooHq5KyAK2T91R
	oZ4RFb7ZIafXAaBjB1skRN18tmOUUV+0/vMRIKAyKgP/lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rbt71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 09:53:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4b8e9112so470288185a.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 01:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771926781; x=1772531581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u828qxpVVFzxepP9ptP2nkRLeZRVHAa0CaoMHz2ebqQ=;
        b=Q3d5nrXhMBQJP13Gj5OhkwicSMZ/G+oI+yUbTDNUgRFgrp2klu0sk3ujv41dS/jpcc
         jfNRaiRqhj21+Ncc/vioQC0+Zjb1301m0GdvBO9pDj/uUl/nKY7HCIEHQfHKVkxa5V7A
         j+dtU5BRhRjID/o4pSEpM0q3JAwr3HeDT6msUHQCBxQigFVYL4Un4UtpfgZAr2BT1QmL
         X6qlPzd1qkk4H/mRMbYqKXPj0Ce4eKB5gPlrsB6zNHZQeVBJu+Go1eCHJkrcGyMScToZ
         zZUcagu42UTn1YrVea3WYuaRYRjV1HQez1ilbnnegF2EB3zsMbyFE97XE335g9fL2b/P
         mqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926781; x=1772531581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u828qxpVVFzxepP9ptP2nkRLeZRVHAa0CaoMHz2ebqQ=;
        b=qXBNTsdR9k/EbQZs/N4Z/5PMrjdoECrAygoPMahcQMj3nllEQBwDIEI3a7oXkpFs0R
         6vNwz4ggo1ROUl7tElLyq4kLcvI22R63/oZixJ11XUAFXbZwUefIjD6KGubehjhmELmn
         0qYz77G3TUxMZBNurmA04eVo2zmh3CD0n4l0cK8JbiOcE1MZdEBLPEwcA6KNcZR1EXQk
         vNr55xrnABbbfgUUa7Wj9d1bZnXLDH7xuQvSwEqpYS4hG3bJ1MBGIwr0k450xeQtxJDc
         QWt2PwVNskFf2XpSUmOUGl9AT9A/r1V3GDbrBC6jrN85FP1JSEyO7OXjsfbysJzulDWk
         CQRg==
X-Forwarded-Encrypted: i=1; AJvYcCXYFVQqesCzROSQcRV6oYNbdKVwSp7XtXifn42LslguFSHcGo9KPjxsFnFn00GEOle0SKkGtTHN6kliSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZrTiu3y6VOv5nRbDJ15on99DnWPeitSTfQe+7/m9k/1jbw63
	sWiI4DhrSsVkZvWwSfAFZla+MBdt60vVZ8oWHd5VXERQdDR7mSHS7YUpcwQiSQUVuOEtE99acbs
	XGkLs2HZg6obvcGMRRRfAypYmYq8b25rz1MWEGcHa5quhffXdHi+npb+KJo0uGJB13Q==
X-Gm-Gg: AZuq6aKJ+Y/dzIkGJLjMMA6t9wJgaEHJo3JsaKPq8PPfdbtkYuoOnRE//QmgKwRlj5Z
	sqGqPzZwF1RFcrCbYMXV7eqOi0Y6YufHJK6cL28HRUcqYGOoh2jKXmOJQJ+vE0cMQ+EujG6zVlC
	0hvIR6Da6bgIhDSjLqP11tmVmL7Z1KBkpK9cJB4Q6BkT3W7L2a6DsypJ/h5JY4Skx8R5o0mgL5n
	EK++XXOPSucCGzYyInk9gG0VPgmWprEITGn+1+KSXFqXvskeC+qlNguAcQwrOwR0YZgub2n1+H+
	5ar0NQ1FuoUxvc70s8tIznaxFkJn/Xp6PYaPdBGdCgUXD18wPV4gAeMJxl60kSKGkJAGUvHxgpg
	kx8k5i4G+ZeyqexBFPA3IhWGCWTVONf2fTGOlYZtuorfnnc9e1VQqA4DbXJWzhAvVA1hfrBBcII
	7sVbSqgCKT8ze62h+77togwSAbJFdfq2EYy84=
X-Received: by 2002:a05:620a:3197:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8cb8c9fe7a4mr1447993385a.25.1771926780999;
        Tue, 24 Feb 2026 01:53:00 -0800 (PST)
X-Received: by 2002:a05:620a:3197:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8cb8c9fe7a4mr1447990085a.25.1771926780409;
        Tue, 24 Feb 2026 01:53:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45a64sm2072227e87.67.2026.02.24.01.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:52:59 -0800 (PST)
Date: Tue, 24 Feb 2026 11:52:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Max McNamee <maxmcnamee@proton.me>,
        Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Raymond Hackley <raymondhackley@protonmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw:
 add device tree
Message-ID: <t3khpv3xltx276k3fgfcawt46yxsb7ro33kffj4kmb6pxrvx2t@mds6hqfaz5ol>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
 <20260223220514.2556033-4-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220514.2556033-4-wonderfulshrinemaidenofparadise@postmarketos.org>
X-Proofpoint-ORIG-GUID: BjTfIWnp7tW08AfWEV6Z3tI0R--S-tLw
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d74fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=d2ve7ugHHLgULyLVOFsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX/st8z70QxG75
 lyDsxQatt+ACsunvhqdOjBrjUhy+rDZmqyU/t74lFz0YqWgjczOktK2vSrsj+mzna4bMnnWt0Mr
 KHG7p65NfNJ+97DOJInvRchb8WPOyOpq4M9h14Gf5h/XbHNm5O7clXEHyDKF6MC2TLXK/Su5D7f
 2aRLgIQJkiHBw5ehZqdStr+yY+uK0XUNexWSg7+d/lldYPOltqaJGOYWVsJ6dPE6qEEx0kHkhIw
 srRETLUTfw6WYVElus89CvPj7mw2BrXMpkjdPlJaqHbl9MLAMqgXRqRXDdCp7wylZZt0ZoRl1E9
 Vc9ar1Wh70qy05r/wn1q+xZ4yVmcQ1C84dm7JRgqkrtg08/4rw+h3fe6CtnuX3UV2TvKsIVBc46
 mmR2kgdD5D/mItnXX24lZbiKnhpw31vrhvf7Jp7+pbk9obx8PU9u1djIovHkIyFZ2CXf01UFQFc
 5eD1G/GsG/IS2sb6rHg==
X-Proofpoint-GUID: BjTfIWnp7tW08AfWEV6Z3tI0R--S-tLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082

On Mon, Feb 23, 2026 at 10:05:14PM +0000, Raymond Hackley wrote:
> From: Max McNamee <maxmcnamee@proton.me>
> 
> Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
> They are similar to the other Samsung devices based on MSM8916 with only a
> few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - USB Device Mode
>  - UART (on USB connector via the SM5502 MUIC)
>  - WCNSS (WiFi/BT)
>  - Regulators
>  - QDSP6 audio
>  - Speaker/earpiece/headphones/microphones via digital/analog codec in
>    MSM8916/PM8916
>  - WWAN Internet via BAM-DMUX
>  - PMIC and charger
>  - Touchscreen
> 
> There are different variants of Core Prime, with some differences in
> NFC and MUIC.
> 
> The common parts are shared in
> msm8916-samsung-fortuna-common.dtsi and msm8916-samsung-rossa-common.dtsi
> to reduce duplication.
> 
> Signed-off-by: Max McNamee <maxmcnamee@proton.me>
> [Raymond: Refactor touchscreen and MUIC. Add commit messages.]
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/msm8916-samsung-coreprimeltevzw.dts  | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

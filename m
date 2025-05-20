Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB128369D
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770804; cv=none; b=GbJf6D4xHImCM39I+y04hi1j5bMjqVMgcrXjJeGBQwD+ZskMajg7yHoi6ngLX0qh5rK9F0k9SjoeiwRTm/jpmgFPNXlbpFGRA1HYvHUPSvQuM2CHSvOvPO2qd3vljGjFZlFOkf2HtyWIq4krIzvgHVlWmu57+8UkRWAQKxKhciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770804; c=relaxed/simple;
	bh=cbcMcmlbjtAT8b4+gF8YGTWbSKSzZ8NVvIsgP/AKuwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F42nk8wFwjAW31r9S9I3FQkhPlA+cFrCGKX+u6P156XEWd5yoeZN/+P4NSq7sHS5wgJWFtthzTomTgefPZS0tTdlaIJ792f1xniYVXOLyV1XxKOrcdmgkv7BKo/yYhcM6haIIlBLdBwSW+UI5ABOeQtc6FXszU5wNqivJOm5S5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDIzpdRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDIzpdRS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdtnQ000535
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i5aonaPIAkvbsT0V7cfk3ibR
	wHajdLgS0bN0SFcHVGg=; b=jDIzpdRSXFh9gEp4fLweqoJydK1dXbY7MKzVrcOz
	a8uejzaGsLs4NZl2tTeX3svcKjGyZaC3JultHrSKGW4kJi35UtcnQ0V4i3Vix8Uv
	TfOnGrn2qBy0yA64ykWm00zJskXGcWjkv/n6Afp643JA6iX+/T2aVdfp4fR7oFbe
	jCSGAdkZ+G7j1aDnGqdWCpjmCNUVaXdEScKtnYzNQs1v5BnHdMr0XZMkHCi+ToVN
	y87xKL9sZbuUGvBm49/ntuK31wJqCB5ffV0LiJ2QOYhGQbq1OroGBf6+SPAFIfP0
	jr8+se2ZnTrgWN6rSWLPojZmssZY7B7zgoDPHyEHSmhnPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18gjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:53:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ae3c3d80so100382376d6.2
        for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 12:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770801; x=1748375601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5aonaPIAkvbsT0V7cfk3ibRwHajdLgS0bN0SFcHVGg=;
        b=GOQzeq4T1kWFKSTDbRgj4HqO3+EDNER5PIBl3PTRonujHQtVtpiioB2FKKhYP0710H
         j6DYWRoGbwEBfUU0PhMbkwcxyXMtBmXf5UpWGj22+XjeKGaathOTTxFkXvoR50yYozdh
         mx5+U1Thnxj2n7SEdCFFR5180N28Kr73uyZtkBCFFLz2srYGamVuGeGcSe++z3PGNrbW
         hLV2h5vSMLtW0FGgDPRNexrQyhOyiRj5d4XZT9CA/G6vuFLp9LtIMpllIsKjUpoCGh/3
         +6e7LrJQ73vO2eoxMuqw1VKV/R93TksZqD5TsraC4OdPv243/vKU5OqOOCPxiKualiYz
         8z/g==
X-Forwarded-Encrypted: i=1; AJvYcCXrqzkHgol+0BbKAER7D3xbfPxklDXYhMOV5tHF8j4nUsI3I7JdoWfKZYmjyS68E460oYZxpuUrtJ6M9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/swGyO9is7eul+B+EiQYJQo9HgDI7p32eYgoUHaWK1qRMuL7d
	I/+WDEKTMBcCiDetEfOzmMebRHHuoT6I1QtrD1irL8CQ36Dy1dZGylAXgbOCVwPSKYQjlDTIb6r
	AgnpySLhzNuqy0GZwDHtt/3gF0BbExp8cOI1VV+NQP7/u76LthpEvCS7EIOPASQ7iuA==
X-Gm-Gg: ASbGnctHIVz/wgSUwc9batl99JKCO3RsC/IixSxmrURkJGK2SvPf7EtLkaLPLggvBOQ
	hUye0hFE4OL31qfIT5x7LQ6cOiK4+EspWfoiGlQMFaCG01KTB+bBQpEVIh2bMn/332ThNW79cQX
	JS0GFNOmoek8a47PuMDhPTmFehwVVQLbNVfYnivX9EqB3Y9lcrMXK5z4GAzPmW2pf9zeYpfo9Or
	Aaf8Hvb1SkArcDcQPZ+nKYzmQl7TATRLDGrQfXfYVZJyi9+9+NC3nr0hJEpkYqDu6KvptA60nfB
	YglP07RPjbuke6HdeU4eFZ458MHe4H/VnrFJzNKbe3JaLwhgr209ijLZX/C2pJSIVAN/vyYzc5g
	=
X-Received: by 2002:a05:6214:202e:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6f8b0881b36mr298714786d6.42.1747770801069;
        Tue, 20 May 2025 12:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6seWDXes4rNoHVANTe5ljrtRMlWKBBOEr44H3bHaU05H3MV8xBXWEhAY/qN3HOFoCI+hEmA==
X-Received: by 2002:a05:6214:202e:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6f8b0881b36mr298714416d6.42.1747770800694;
        Tue, 20 May 2025 12:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f52csm2477061e87.234.2025.05.20.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:53:19 -0700 (PDT)
Date: Tue, 20 May 2025 22:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Message-ID: <5acpcyzscv47uyyjhtpfi3x7oh47wafo4n6kd5iu6zs7rkpzro@nwkupv5mpjpi>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
X-Proofpoint-GUID: c_7IeAOj1vyPsgUsMzg2NkKEnDHn3W-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX1mG8Hq97JqSe
 oi9v9eV7JvumKuPpJBSJVhodTft0Xsw8PxEHNolfVGvTNvG7EmmOiqG5TC6LyL6AgC51QBlweSJ
 v8BC4OyIm2GnGdergtxAW4gEOsWhoOogc4x9VCXjiOKdNPs88cglNMPIn+wuXCdn7m6VIjmoZRg
 HlpjT6UDPzNQ1urJolsyNJrEg5geRBWhkBB83sLvw66tm3UAOpbyZlBeLD0gJbiWoBQmZZCq39n
 BSZuEeNUXUPtyjr2+CqpEIYKuUIwJq7MApyrg4tMXRPOyZMp1X+/Ps/jsGmM1iiYuasx2IIm6QM
 VVq9mbrIsjM7BmsYQsysalFEp3rLFP2/Yh+pgtK3gLVdm3SM8bMN6jkkoWetkK/fYU3Dg5Dexg/
 EdIxvfdAkGsIm1sjiRf7BM4ixOmZG3DtOGyhKAYaCcxcHkfbdWn+u5mKmbmnQ4NR5EdFng20
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682cddb2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=a9wmfB65m3qGRrS3yC4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-ORIG-GUID: c_7IeAOj1vyPsgUsMzg2NkKEnDHn3W-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=813 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200160

On Tue, May 20, 2025 at 08:23:02PM +0100, Bryan O'Donoghue wrote:
> On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> > +			compatible = "qcom,msm8939-camss";
> > +			reg = <0x01b0ac00 0x200>,
> <0x01b0ac00 0x0 0x200 0x0>

No.

                        #address-cells = <1>;
                        #size-cells = <1>;


-- 
With best wishes
Dmitry

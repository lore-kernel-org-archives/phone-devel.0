Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9F1F8722
	for <phone-devel@vger.kernel.org>; Sat,  4 Oct 2025 06:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759558699; cv=none; b=gTOHnTpzaqxZ0aP4R0Cmyb1DqQT3R2HFKllfUNb6VSVqhzASnFKe6iTeKAHRRkfyzSC+Ukm+jOoT8ifzIf27o0FUxZGdFOq4GTWXxFNYE1M0xTNKPrx3q9u5hftxntA6IbRhBFLu3ddpwt0Pp3HfTLh6BSLKRAv7VnIGc5k/Wx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759558699; c=relaxed/simple;
	bh=31XWcry7gNMJMBFj5xXJAolY8j1SpoyiZ5JC83YhKwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPltyJpzzVqKKb3VHFv+u/KfVrWReDos9EaxraFmrgHYiWX1pu3yDmD2X3CmTLEO4qKIETBBADs4iA+ueq+lvtndbgeMBJqIVhG2lUtEl2l9FR2vgqXwZvqdz0K1Vh4zb67x0M8UTILy4T2bUrdtBkdNi8WYmzGlwjiH9G7UyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHs/b3Gh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHs/b3Gh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5944pkJ2024675
	for <phone-devel@vger.kernel.org>; Sat, 4 Oct 2025 06:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qBBjEdaHMll6uf1tUYCMqnSa
	V10k6JLabN7CElpyVZY=; b=SHs/b3GhoPVU69KMdKMUFj8FrlJEJxFn1F1FcUw1
	ox6ciOhNcxI0exwOkWebzcYY21bZi9BO9OUIR0lk1rYwfW0u+HkHsq8kPgmRPNcv
	xjXhtS1hh+TNFpjRYtGoEZ5lHFbORk8NmDr+/aexehj9dQNVGlf5N0zy25w3EUNG
	oZxOxftFNniV6jkiLy+aXtipmwkemtcL2nLJM1I6qdKQ47UQza7Gley2Xoa8HP8L
	QOIKnkV53vpdLJDZseA/ae2A3eEszxUpQqrrOdqaoO6R7+Zr2JvPZoCYkzQnWNF2
	TM3JJWkMPQHCEA11sYIlO/VpATbjwaM0XdmKqc8zvVC8Cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7g353-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 04 Oct 2025 06:18:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df60ea7a1bso61997161cf.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 23:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759558696; x=1760163496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBBjEdaHMll6uf1tUYCMqnSaV10k6JLabN7CElpyVZY=;
        b=jumaaqHNbBtSQ1lCX7ZwW0SYeOty1fxnLph0mw1cSIytHf64frS8EngcHgPgTUNi7b
         PbP9y4i/7e/y4Gk83Yz9+cALsAq380wVcY1nfJMLL+oeCQYuXo9whjEttUvbWH0eQoKR
         1EEQ08bwRBY/S2ZJsTK3kC6PrLs7xgPRarI4XLkZwLlYl77mVM2t/Kqk+EG931fiuQvE
         631O7I0o/lE1rdPUgsTHrd/rDsOZnooUmFHxiFo0dCv+IXayODq635v5MZ9P4OEVy6YH
         wi+WEi5PWtpClFTNUGimn0rBpSCgPqiQujPAPQenWTAI9ISO1sdMc4b5HzVFQz+QszFZ
         P9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWFAh0MSpyOne1sIIJP0uY8TO8wlAavBEGg3rdzD/I8HRMYX5no95beg2tvsZADn/i/TWzx27RDn/WfUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJ114//1EcWVkSAeTQ+PhMbsVDo3E/SufsMeI1F+1F/8DoO9r
	cBQEhm/+xV6hgtapDkjrDRmgp2rrEMNd8D3oYIENJIJQw0ig4Uo2NQ46WUlfGRgMA4RkMtJXNrC
	Z2OXPTB9qhtdYPBKQ/0tz11NbisSmwjpy6Eh8yYeibxzkZ7C2CoAIZ06jnC6wpdyt+g==
X-Gm-Gg: ASbGncv2IPXYPWh1dPNVfqBrOtc0Pt8DSJDHakuM20XnTFLm9UgXphdAoGuqgNoie88
	IClv3Z2BnkJr4niPWkUD9GP3y5GaDIo/tE9eZaScj18yiRgy6wYxF/NGkkdVZcl7RF3DuYteA++
	6hfIcPKo7snzb//pnYifu4MO9/rB+rawhp3GJ+G8BoJ4TSsg0XfxDurMbacJVlG75dUarrqPGES
	OwzIug0UlaWnme3WaDVK96lrhHeDcXx+8OZfBpixuMPSI4uW46OI79F9dbBNpJAPBjntFm4051e
	g2xd71bfNzuMJ0cLOHZTzr/ckD57VP3jSC82QlsXzLzXar/xwDE/r/q3XftyXo45iuQ0YffBsdm
	SMZ7TSwUlLf//EuJtyZpx/0oSuhvf+OiaFALirzXIw6SbnvhmeNQdNkxX0g==
X-Received: by 2002:a05:622a:58e:b0:4b7:a92d:3d99 with SMTP id d75a77b69052e-4e576a469a0mr74836341cf.1.1759558695968;
        Fri, 03 Oct 2025 23:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRpdIygFcf6KTn5/QEqqXWhnCJScGwKcv5Z0AXlIF9fllAXu6mj2WemBQzEzvWqJKCmZoO4A==
X-Received: by 2002:a05:622a:58e:b0:4b7:a92d:3d99 with SMTP id d75a77b69052e-4e576a469a0mr74836211cf.1.1759558695552;
        Fri, 03 Oct 2025 23:18:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124378sm2558329e87.11.2025.10.03.23.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:18:13 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:18:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm6490-shift-otter: Use correct
 compatible for audiocc
Message-ID: <iwyoaxo53kz5b7kyz5gxme5ywtn22ho7vsrl7tsvw7uogzjz55@oeekjknm6qew>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-4-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-4-5a45923ef705@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX83lI92phbo0G
 zcY0b0h2/X0/sDnK+YWtfazYZp2KO8k2i3XkKCV8XdZQFvRaw7gv/8lJz5jC7RIvdoxn+BNUMI/
 XqJpNg2rz7fxsnyjeAX9eyP9hYhTyBUjMyolPmb3AqZ6ma+F4kQrcsTc/7BMWxO/RvQBGtsL5OT
 3bZ5lsnzLMEFxNpE1B2P5OPMO2M9mGA1WW+/wX63g/VBvJJPqlrVJCIfck75sogdwcM45Msg6yq
 eDJYFURKBzgm8UjcOYFVso/RsxyvtRvcdZyeaw8mm5KLbirIp4+8nt724K2chPa45VnRN8Ro3op
 0vBbLvhiFxtwSWApo7YAWSbritDdWe78/opIZjHgx0GGUlb8AwI6nkBCRxAa2IEPGwzbXaofhCc
 yLLuFB9xKU7Zd4PyRxz9z9lkl/lWBw==
X-Proofpoint-ORIG-GUID: wVE8dj092T-59VoeMLxa6m-B0a1gmDoh
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e0bc29 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZWl6vx9Q9smWLlo6MzwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: wVE8dj092T-59VoeMLxa6m-B0a1gmDoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On Tue, Sep 30, 2025 at 03:57:04PM +0200, Luca Weiss wrote:
> Use the correct compatible for this phone with standard Qualcomm
> firmware and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

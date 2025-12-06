Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9C32264AA
	for <phone-devel@vger.kernel.org>; Sat,  6 Dec 2025 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987077; cv=none; b=BJR/LIiApFK3Bp7gFPkmk3fECARiPtt/tcDC8pQDi/ZGrjwMrhlha05bDRnPSXwc9Lt1e4oW1/oradfqw7RdD+mLtVpJFDX/yYtRUX7vSXUQk//8OiEkgtenqd2YwfXjCyqampNyTC2nRLauiw2kM5/IlE1+gBrXKRH5Y1GsWD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987077; c=relaxed/simple;
	bh=x+U9tS+e0THz8xr64Aoo0N5Tbkttz6dX6tU5sJ8+UsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ssq9RrJjiuJkIcWBZvxO2lwCG9uwrPI6C3miFlbMLf6E7OWA9sSSjNXMYSiahO96wP+XDlPF83opYnHu7Z7RPEwv2j5vYYCrBdm3yuESoelDu0T/7r/bONDtgz5sWtFWy7i1+104Y1yUJHkSJx2B/ivMkIi87kYtB0fpRXAkMc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb4QUNNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4aRuxTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb4QUNNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4aRuxTO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBMBW887448
	for <phone-devel@vger.kernel.org>; Sat, 6 Dec 2025 02:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HvNQOfKbO9RFDYeuz2gybVEN
	gK3IMZF711m7vFLClV8=; b=gb4QUNNh31up/8ecEXbcpv6opENxEppOfpQ9m1uP
	0GtRXL7GEm6M0s/P+BoUeKkmOmaFOfsFYKwwXYpf1sCjXwIQCRLEJii5GyXPz74B
	TD8viEvlilA4w32eW9JTHLVXEjl+C0uMo+BhdDRHy/kIdx1/nZmP4V328Bu7VouM
	HdQOqeCWZzr2yEG4ToB3nt1+VK+FB0eo+ttrQ1npLwPKoUA7uOFW36AGZUXedL0t
	wzt42mpKl2f/SZyM43uocrHEO3YFf7/1eKIoEVGHyiayWwkAb/4hQs3SLklzE8VE
	Ff7hGhGAuhmi3ajioEkcnx+TYQC+6lboSh3nA//2pdZvEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvk4rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 06 Dec 2025 02:11:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2657cfcdaso359333185a.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 18:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764987074; x=1765591874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvNQOfKbO9RFDYeuz2gybVENgK3IMZF711m7vFLClV8=;
        b=c4aRuxTOFpaD/6jTruXCtte5OSPrEq+sybRdVxMF8V8Gi6US04aYC3hwA2U/53tA8N
         aoRoB+cxZEbE+MqD+zT8cTFZrVrBwlog929q36V16o5c7pOeuJ4Kci2ngnzTFqgd5LgC
         4tUXgKOCx1SdV8FylgynN9Ve2o8aJL4uF46ghXDXU/K4mWrfrUqlcoejNcRcgqHGH8mo
         CFMAqGukDuiwxVMmkka4kyIpujxZ5d5WPWJCXY9eKpmvspODUEYQSmoycEy/Mr49PkCZ
         kMe4kNryRclB1BzRxrcY2x0w2+UkR1h2jUPwa0pHJNx3kv7Vf7O+nWa09dbksTR8mXXa
         c5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987074; x=1765591874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvNQOfKbO9RFDYeuz2gybVENgK3IMZF711m7vFLClV8=;
        b=oIgeWTZ17MAhvehwcMgh0LUcJEkBgJCR/8t8SjUs0DVzW5U+evyL5ohb6Asxt3HOt7
         O8gRrG1xqdg8cqBadRiYSx7Ql8YNLXLLZu6xFSZPw/Fqv/CDRAPJ4S75+shHbXD7DnfB
         VVVNllf8RktDTkoNlODrK5AYHQ+cebRi5I+kEs5IykWIu15YkPMDf872tYLHCIz70rJF
         fSDa5Gb1HdcQy9VfjYbj1lOCxvPDJemv0B1iYoJ27OzhJaOGh9Wuykbz5WhzHjN4XwrO
         9BW8wIXrMem2JNpaMQHes3wVlft+m6ZQpFOn3PyeBIRo2KyxTClymGIPeDvwfdFS7SOf
         uHjw==
X-Forwarded-Encrypted: i=1; AJvYcCW3iVRomwVe+DsQz8PRtVuzAaOflWtqmYTC+ggPd7FmNBdo/PwgrK+9u815zz2os08EDPfZI8G5ZUwPUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jczYwZ3l9BIwbKj4gl3QJtQ3y2Xni8RFLbUjJqpVIe/r0XV4
	dUNKeEBuk+wsVNn4cmylDr8DTZ2B6fgG6EAXc2HAR6ztrYEk4G9msry98qRqfd1bwITDukZn9JF
	UbgXYX7lowI3wKOL60SwYDVCFGjsmfl118TWF7/RL0mDgnG60BcZiExQdEnPOMGfORg==
X-Gm-Gg: ASbGnctdZSFU8U+zUSP1M01qIc4Yb09hmiBSki7a46rYVQKMVCBDUd60yc5RQhCZSD7
	XP1xUM35gJh4yMTNyfhg6VKE24PJcfXA87uMv3i2BgznOGu5bmIP0FEsrQl/N34Qw26JMRuRKXP
	2HUTaYq/STtQ0H+MPA0SGeWdejrfj2hLuA8HP9KVVBJ7sVYF2bQYjIxCU4pCc2cVaCEB2+vttgE
	i9eKcmBCHOd4ap4mRFAIUJ1zxM6L0Nei5zbPtH1gmHBz6rPJD1AYqW45jzu6BnEF96PyQVEjLSx
	xiDCw9ev7HpYkYUmmbpV5QNjaMPnBNsswgSaV37DM9s3jygpFcDM15ZeXgCPNwR2HYN5Q9ZdI8s
	bjkxtgogj/XYNUukFKIWqe2iDwebQ+0BOQzzPmFzWhvaz8A995fgIt6nrykPVEq2ZTCV3fICJLD
	kdiQmhhRKJwPByv+OX4UU48Rw=
X-Received: by 2002:a05:620a:444e:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8b6a233156cmr172726285a.14.1764987073951;
        Fri, 05 Dec 2025 18:11:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZPNMyTxsMzxfytNMRMe8+8/wii7QnaK+HU2IBoABH8YBoCv8QBteXW81W3/Io0PTJGnBKPQ==
X-Received: by 2002:a05:620a:444e:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8b6a233156cmr172722885a.14.1764987073443;
        Fri, 05 Dec 2025 18:11:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e4d7sm1979656e87.46.2025.12.05.18.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:11:12 -0800 (PST)
Date: Sat, 6 Dec 2025 04:11:09 +0200
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
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v5 06/12] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <jj6kmfd3cr3k4hiylzkhrwzt5b5vrrndcfoo347n3eyzj56tc4@66fv5bagydyz>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-6-80c1ffca8487@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-judyln-dts-v5-6-80c1ffca8487@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNSBTYWx0ZWRfX6rOzAPSXosQh
 CPuSEqsXA42hU7fVwm5rSHPrwU4ztQnMuxj39JMvbGrxxUizsaxyh85RlwaU+gG0OL6LfmEIOb3
 LQdjVyuf10AMnh4KEq+Bz6srxJ36ZvAsRL3ONUEPfVVABKqk9ITs63c0SnrfgAeWzRBVoTgZwNV
 IqEpVpJX2H5KHyp2Lh2n2FA6NFV2Mxnv1chd1TLFO+h9u11UuFp5V1sDp0TkZEAu1fELZ5z9woZ
 O7osetwEwQenn52JSTavbdRcUxMlHRoxh/K8fEbOKEj0nOzd9anUE42ErEiKkDiT0vyW0YZFpxx
 U7WoKn+GCN5idsTAUaRmVJNoiOGIJZpZfUod733DlZWwSz5bKkhrbbgWbimYNVEfWCVZ6FYcjAt
 wHktNdfSYZP+4vKb39BohSBOiXNrlw==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=693390c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Gbw9aFdXAAAA:8 a=xAAzZAXW8IgVFa-X7UgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: pkU_8SO9RC_ehpz17FMYvnAXUm3XdQ_d
X-Proofpoint-ORIG-GUID: pkU_8SO9RC_ehpz17FMYvnAXUm3XdQ_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060015

On Wed, Dec 03, 2025 at 01:40:55AM -0800, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, bluetooth, venus, gpu
> 
> Enable adsp and cdsp nodes since their firmware is present
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

Two separate commits, please.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 20 +++++++++++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039FC2DF14C
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777963; cv=none; b=Q6tH9dtQ7JZDdOm81Nt7h4o+CyNLzMHi0CsPwGQxSEoYNBpuw7P/qFJ1BQg4/5I+I0N+NeGDKZcKA2mgPEzFQxF3HSL6/UYkjV81Vtc1WamJ0Jn/bW4F8i7uazFtaDnOH8k/YZC1cegtne4+7Z2j1eH7nq4jB/xp4Otd4wgDEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777963; c=relaxed/simple;
	bh=7I1eZDkRK/wdoYxZ7s+Ps63Cn8C3cZQaKdTWPLvtd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2W1wndfhNM6vp8O+/1wQvuLs0mWUZLFuklLb3cKNGUxseI+2YZzha7OstNMW9pFBJyh+vNA2tCDHpWnEXOgPXR4uaI+7OMLN/IHo3AME4M7vJIpWUDkLwnP9Ear1d9rdzF+SelLeR9DQFn+aaVIyp3A80HQ71OjckVBiEUb0cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgBXDthx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnXl+ouP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBXDthx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnXl+ouP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T7Tcmp3475196
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hAyNkY+C3fVpD3lC1c6+6VJB
	YgiejZKZd/p+VA35QAk=; b=DgBXDthxv5tldkiJRuVhdhJOm1JntCp8ib32vvFd
	RoBiF+V/tECzgqQFTGzs9azaf3Kb7oG6v0MhZzhdQGzhNXEC6b7ubvFu+QNZ+TUt
	N+tVoeifX6wP6uTT3yhnPvxuXtNw2UV/SNnqhAiIcjk5PA1HwzB6n5XMycT5Z4Fx
	cOcTh1lVqwNYqbp0UJdo/qMTZeeTPXm1RwtRmN8oYkVW9ufbYq4WbkneiLkTuiQx
	OufqQEIixd4QVQsZuGxRhqWwGp2Nok663vnGN4CcncCmNxzvFj6hIhSBpTJ98c9Y
	cyAmjXYZk2XxDjitYA4Z/t64eOC74HPnFcFbOOs9o6UU/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm2vdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 09:52:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so87310441cf.1
        for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777959; x=1775382759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=dnXl+ouPVigFEwqbh2pAOGlvFbzv/+T6ea/PFG9zJhKr3bSLktCImrQvBJt+b+U0HE
         Y7gPQ2alC8JUaluNfdvvSipJtiKTtDh2feUz5vpTypmLTjU5BnkC15neFXdjvKdFUXBg
         50EBgUJcir1xyih6Ju6AMI/PXwo+wj/tp3MB4EywvgX0fA9TYCbt/2lnvnPbrnieHFX2
         BxeogZcOVZB94yD710xJNzrLYwZ5ZZuUPy5j5MAw0xyqQVji3aUGij6EftjOJGG8ifTC
         Iv2mmBp0kadMF3pR8dQCrjYJG7ecg0coMpDgkP1QmMvrP2/zrqLhveKglJwSPANd71DQ
         i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777959; x=1775382759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=k7iHF1qb2GzK/xkUfj0aaHbOjIyxaTwPla1DBD5uAEe9ux1Q2UkTNjZiX7d0W7fRHS
         s5L9TGTyZEwr65ScD4ft1kdmk//FCY4w9fwo3YMCH/loyNI5tZbmXwK0CVGd8rbbeb+c
         xLXml/uPLiK1TpqX2XlC7QfBuQ1KqAHypdqujLNeA2YzcPZ3iT9QO8OeZgf2P/9KvCNS
         ePOBqvhBu/BwayAbDfoDJ8DK+MqFYwSHtUllzmFuxt26WfCljGz5R9Yz990/beHaZQL8
         gNbIjBIHKB7hm4djKaIHPVRr4bb8v0A6LgwRPx8Za5vdjfeK/oX3uBF5T8eeH4vrQM0t
         4RBA==
X-Forwarded-Encrypted: i=1; AJvYcCUui8UnVE2gm/Snhcrx037nu8VDO5pkmgR/G+4+C8mpYgcqyV7BGj5quO0IrnNWHZqBg5rgSeJFW28W5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGRskpWGYrksEM/pKFRQ0VDG6n7DMPfVrKsfmJMWxqpULIWEvd
	lAVYl5MGZ330+bqLQn+pFYHKkcwJmSXnRi100FyHzXvGjzPdnt4NhDFGIGhiBxp7A1Xz9YX4t2S
	XZanMIhGp/8Q5T7ytqpDiCGb/UXm0DxqbSRAQYDK7YU2aEarA8Du7tu82XH4FOelldg==
X-Gm-Gg: ATEYQzxepur8lGYLS13CAMSHMRRC4cv2fDTAF5rqyC0a2zz4qKU4cnpM/dFKxZHFUMK
	agDyMedoVHDjep5SPbtXvIysSrfuLnq+mbU6yIhyVNaWjcqFVgggVLmMhtn03RqBibkIsfMPtpC
	Q16Cp17PY7F9KHpA8/gD3vgywYEwPNn7hBbReYHsRAxS7kTyNsgx9w4+wz/KoDimndXCxEtVvSz
	EgkdeuRbmIC6Bdv/SOMbynOLnbs3RS2RU2I3aiY/l5EDqZGOulzLnMYIK1lDLu4Kjv/lNcSlE/s
	gG6xadX0qRhdg9/neybIrhYrxo9Inmz3Fhdlc6XJZ3dj9d7mI0YRdcPEjQ3/VYMu2l3xEFTTYlC
	kWebQHVzGGpb/y8qrzaT92DczKiVNfShyNF48PGkzNFs6yfi3KU8enp1ccYRvq3VcW735trRy24
	GlcydUTazrThuZrLpCHzTJEpBozldkf9HOCLY=
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867711cf.4.1774777959397;
        Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867571cf.4.1774777958955;
        Sun, 29 Mar 2026 02:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm8782231fa.42.2026.03.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:52:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:52:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add
 PMI632 Type-C property
Message-ID: <raecqyz4r7je5s6ecyclffwoi7kqt2oqwctj6aevj5tsfuxfkz@5i2jb5i62thx>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
 <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
X-Proofpoint-ORIG-GUID: XQvxELvRbFqMRzVy2WiB5IyJh18JnoRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX4GcNPifvH/Np
 kstNbUB8LfFP2WLCwvB1yMJ96Vr7YcCO8kmTZcQRPX2UXUDFFUMn4heyYjsAa+o1d9BuriFQHX4
 JQjKNqUGIGdEE+x0c5XDQOPR+act1lz6jofKevwBANZ2Oncttl2/X5ahen0rx2Wx4kYEYkIDswE
 wkoeyeTM+XxIRFPffWf4f92JUyA1MyWSPbpIbIARnhcVkpqUDKSvEu1N4H0pM8OKCRCM+ucezZe
 Dfv8yg/j3RfbwMhrAx74OWmmn5zpL3VX0xpdoBDjkmZzoAsoXH/eTKw95jKtvh6oIrdlQOWSunZ
 El8Y+FhR5+QKAf8TQfIjdDo4vC1xHu2TUcw4hk/BzQW8GeQDsbHKT1VupvP1izr4udcWyH2XxgE
 W79jHEDoe7wOZ5c5XcppfbIhFi1sfKTFjAZPHD1ajdJrPC/V0C32LdCHreEly+Jsl/YZeBHtew6
 M5skR/u2sDnAUKtbjGQ==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69c8f668 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=4paqipjyf0t-I0uxfbgA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XQvxELvRbFqMRzVy2WiB5IyJh18JnoRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075

On Sun, Mar 29, 2026 at 04:48:00AM +0000, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

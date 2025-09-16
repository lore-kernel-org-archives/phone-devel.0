Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017E2BDC0F
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017429; cv=none; b=T1Vjqi7LBCpyG2+PJ/moF6kPdgjgILhWc9Ao/fnKhq0nORVPg9BVsM0GYP6LATrZ25B5zOP16O7ag7Q3/uA5p90MFjz7GQsnDGdSHPHxf1TWVyYGXSqLxMHlGeXpozUbMXCKGl8vGNMLoetNmOkUrfr27TBya07QadLQEMig2gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017429; c=relaxed/simple;
	bh=XbVFcqCWViC3Ty/3Z0wTLN06tYYojOW9npjz34zaKWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxwXJGZFsgiMnihs0DLvDY8z8ta6/71PrDpOsz0kD5AuKEIlE3NOzPLVX8PKAIZSK7ygt9p3bWJJk8JTd6CQeyTGmvvuXwjRW5UIyp1ztXlv5EkqmxqY53Ovxd6H8ZU/plXxIH/IVSfk5Rdh+b34GfjLbdBKI7zQYR5tvhshF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClHK62Cv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClHK62Cv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3piY8012552
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wKZA8BPl5AnCLEV2joJ24RdF
	tVw9jv4aVixR67Q19MY=; b=ClHK62CvK3ZDTQyUBb8sTAip0ggbSrF2CZpplJ5x
	kO5ini0JvfXSEuOy/Lpkb+DFOFY8lTxJaIGNYgOa7plJ3Xabo/CJ6WGBFN4D2DQn
	RkYRVLah6rRN+eEVLwJsRZY6rNYvjfClgFgKNMXrlAQCdr8ECZd3z6uFXgxfHCiM
	mq03sRBzh2eBtKC6clanyxDxRY85HYJCXhJAyV2wgrrgkunjnFz0wX58aR1Phngy
	9x5aD0uyOCb2jV7GwMq9IiTDcL13t+Mw0o/SwEACbgVeuihHe4q7CXUkZCOMMqca
	udi0dvciKfes0syQg6dB6iKhND0LNku6ga7hvCS3RbhN3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072rf7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:10:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-77a517cbfa2so45600506d6.0
        for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 03:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017425; x=1758622225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKZA8BPl5AnCLEV2joJ24RdFtVw9jv4aVixR67Q19MY=;
        b=js4lJHpD71XSD2p09/wYLvZ5+H3pMFjGTLi/3PhFtcRJEQolp/2nFao8PJOFH4VJZk
         z00j76TBgXJ4xDVe9EDydGslHgDIfxzw9dm+wNLnRhYb9YeyeXRAemFQMRxDGG7S/zvO
         ury9t5t3A8YMz/N73b/Je4rEInC+1kzkYRbQuGDSxDBkGMwF19Y+zjtlIpzKuqCFgXpC
         Sr/ZWk2zN5mLWPn02aQ3DUwWGh99jUr8mvSg3izzB52dOFj3xAC07PQrzv2sbsf/KXkg
         oQzJlO6iarkSAZY2YtBQqKz/tmiP42P5TgreYujwa8WkP7UYAApxg/ZRKXM9xRfh4VGt
         H+xg==
X-Forwarded-Encrypted: i=1; AJvYcCUVGru2+uI8BeMbXGBoIACdwLcKboljp6tm0Lcx0M/XLplqOYFDEhOHc8tXp2RX4bANbg0Xy06x4qYwDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6Sx4L3jU/I4Z7iJSzhE6UTez2pKJYl8/p0uGQp+6tmRAwwik
	rOg3YL1zlVFcqPgMay5ybPnJBQyDSphCRWbaW07LDxMn96E5Cp444wC0V8Z14qnoXL+RZ7XFTvP
	gy/3Y5DqbBDsTfzLSUcl80ZASodHD1A8OrysngJf60FZhOuZV96/U32jZRIW29o6Ovw==
X-Gm-Gg: ASbGnctGzZws3AGUcgTQMbkJuE3GwhZVgUHod9ITIk0QZ/DduqZjEgV2b7v9SMNt2Wt
	7oPCUlvOoCJOpTamaU8nztgTc52ncLX+vAsJw8vib9I4ZZFYaf47ZRG9OsvfcT18oJWnM8k21B+
	/DyqW9+e2ESEl2KFNTV2nrGtLFTONY9z9JvOTR/eOCQC6TQf568BtrQ1mDUDZpr9Xvz0JsnCOzl
	WSEhfKBns4DQ93/rsEL6Jm4huGCS2jjJuPwtrmnaFkAyuupzZMz0UHE681l4+1SOJFrRKCAQ8sM
	jtoJMRHzbk7zBX0lNzje+RTrE4mc514jxyBc3xSiQmaXg3ydyzE8fJwKJHRhCzQG0/VH/lfHgw7
	aghDMzHd9UN5aR+mpXNHsBZ9KGjPPz9BVJSL2RSGtNCQBdsybOFfL
X-Received: by 2002:a05:6214:dae:b0:78d:4b58:2eca with SMTP id 6a1803df08f44-78d4b582f82mr20475236d6.26.1758017424887;
        Tue, 16 Sep 2025 03:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1ZEAVjtbKX71iAiDJ19Ofyo+pVaF7VLXJpCCJ2aZl++ji5oAc1d4XKZOcSuQMCS9y6Mh/8Q==
X-Received: by 2002:a05:6214:dae:b0:78d:4b58:2eca with SMTP id 6a1803df08f44-78d4b582f82mr20474886d6.26.1758017424433;
        Tue, 16 Sep 2025 03:10:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e651919d1sm4386662e87.126.2025.09.16.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:10:23 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Message-ID: <pjalx3o2lfh3g6fxsaw3beir7ufpls4j5y3f7zdsgopvpr4vuc@5vldxr6lvojs>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX3jWo6i6eqjZG
 +eTrRCDPxCXClhCe+RiZ3eR3P0dHxsF82+EXNq5U7fGaO2gBIbQdoqq72Akn4AX9SYEoRFiPWY0
 I7H6P/WzVNFoAqXjn/yROvIVJTSUtxfq73vVBdLSq2D4Sfa1EWFvFMwK8kHy54QpPvDeTWT+4wW
 sW7Jx/uNtixVlfU7Y5PBc5VaNDuDrD6BdiKrL1OplpKm+MuUsAca+4iUjzidds+tkufJ9a1t2h3
 FKY5vwhkugv2/xbL79g3GkJ3kRACVaATvKE2qNlPzzB5+qMt6gz+CQDO1H4HM3zngjdJrBJajcF
 m/8HXhgqvfzaNzrD9fxt9KLe+7K9oDjDbOephudGoUaKPqCIct6d/W8UeJOJS7xcacycGRKBG8Y
 wfzv0KN6
X-Proofpoint-GUID: lVJsgJfQRMNjictn4ostwbPxpoVqlySN
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c93791 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=08tnehPgh3LRQT3fcTIA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: lVJsgJfQRMNjictn4ostwbPxpoVqlySN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On Fri, Mar 14, 2025 at 10:17:02AM +0100, Luca Weiss wrote:
> During upstreaming the order of clocks was adjusted to match the
> upstream sort order, but mistakently freq-table-hz wasn't re-ordered
> with the new order.
> 
> Fix that by moving the entry for the ICE clk to the last place.
> 
> Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

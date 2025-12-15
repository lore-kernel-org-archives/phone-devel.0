Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEDC230BD5
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802000; cv=none; b=acw7ekjWoyOl14iV0CM/8ek2Hd7JWdrdVdBbPMlFgUzeBPgOxk1whnDCbOAFm3P/CUksH3LtJ9P7rEyHb+bF4YfeGU4lshk38uhLfm5Dw3wSRqD+dz/kNmFbseGwInZXpMpsh/VL90RyHXdDKQE3hgvq+MxsvWLJku0JE54SKWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802000; c=relaxed/simple;
	bh=x9xTIu7Z3nI+BHXPlc3xpHoopuIiNWvUy7/yPpbNNrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zu1FX/khbakbHaTq17PHd2GYBleOCzqu5vHZnsWSo8SO0BH2HDG8UTbqstlMyn01oB2ZPGdtAb7AiQWZNlfye1EV3jri5Z7IEC+6troMLar5YJnRIdoEaggyNuE4VJoklv0Y9rR/1qe2OsCQ+MjqWAM62uGw46yInpJ5Dn7NJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VyWXwdiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdeQDcI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyWXwdiA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdeQDcI3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFB2nHI4003136
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 12:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4/NPiC8qxSXxsgy7wgYQjJm4
	FSRDvFbKGkMs0zoelMk=; b=VyWXwdiArwAyngWo6H1KHLKhny3ZTfz9pKdBmuOG
	yR4LpPHw9iCuTKoccVfJOmYWUiIJ1sjo9/gex0ctaCzYXdGD765naZFtpQIYorQM
	hbfsPW5E21TvGeL2YFEtvNsL8twT71m9gQqLPjAQV2HnNldrFkpwrzeBhpCHe0V1
	hnTvaHgdhZSM7+iFvuElWn9WVSfvFmyV0A+LABQs41QZjeLZCqvZDDJnyudgkKbq
	kNklyT2wsRkxLeswQND7IoLFFxl6mLVDJk03FSHeNlFBd90AU5R4ORBzCsM29scj
	S9eP5uYr8JWz42RTHsr7Pt5nM1iOHcBcEostetrfpWjefw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2h44g7na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 12:33:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso68434291cf.1
        for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765801995; x=1766406795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/NPiC8qxSXxsgy7wgYQjJm4FSRDvFbKGkMs0zoelMk=;
        b=PdeQDcI3EzcMoZnDW9jfN7dZ0qwRsIxgG6BCyNA1nq8lFkPtW9sn/0G/2SJzuMY+9P
         nWXUrQO/MOBRBM9lWCCELtqGQOh/z+TUMf6t132dKJs3LAY2P2bnYDBhynalzjL42WAd
         cJtXOsATGZjz4I0Mnz4YanGf+tNPzcXHohW0q+pYivSBgWVAEZjoiLQMR2074+JL/NW4
         /7t2+/zbnPgs8pZ/fhdHbFaGsa19PJDlxR2dIYlcZwp5tUZgWXEYAFF5xvxzHy/21JG0
         4zm9hwd5j+1xB4lnBbrHSQoaOX8fvYOtNua++JKPyh2RAGl4tqy5x3sotn0+oDOsWfhP
         ebzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765801995; x=1766406795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/NPiC8qxSXxsgy7wgYQjJm4FSRDvFbKGkMs0zoelMk=;
        b=rVon6Ko9B0XXNTPBeXFc+Bj/EuOUJWj4mCk6bQByr5j7ZUs/qVWoPPxwuR6R5jDNjn
         Sy5yUMvPC5w67BU5DNwSZcM0+SiS6ZjTNaqca1y7tT6OAd7ucgSVm69gn6tpdwrjA53B
         WR8kHCHS59M0hFiE8x+1oCVoGFpLKu6WMts9kYOW93kQ25deCGa3rOcfDsErBNUONbkp
         LPd9i371H6YsXdgm2+ktws80+rHBxYSGbKri1DjPDqZV8mnmEDqNu5nkTmolaJJw/hep
         HUFEXZGk8oMCYasRnfL/nzT8NFAUI+ArT/fme7zbCVjNG45TzRUTyUaj1hzJCWOavH+5
         AcUA==
X-Forwarded-Encrypted: i=1; AJvYcCV9WeM2AaWQQTdpWpheCTzu3qN5Xkb/Xq2nk8IiasyewJYw9D5c8QpPS7pKOFpeY47spy7GrFLzh1bYOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTCFzptGySdVJHLhPugQCUdYJM+YNoImryLKsw3HFeM3LBfc3
	TIFeu+VvIzLJffuP4gnxtrJDsgyX6JQf0Q1aGvp2nAukefjxaKOh6ILxbb5X9ykMmXOuDBSGX9b
	X54rhFdlR4pikXl6xDp01DFNNoFxQEvBCPuwt0BSqXA0AIwF1h45e4pC7YutRrMVtEQ==
X-Gm-Gg: AY/fxX7hs7fup3wGjJx67k77AJqQ8JDI5hANUNfNzSv9Kxbf1ftD6d7ERvy940ft90N
	UBou3ywX4czXRlEfERGB4ZY/TBU7N+zPPwZvrFcN9fGsPZK1UeB7hiNZgfQekk11sZ68Q5ObFab
	H+ApZbcC5kiGoRbuyZK2SKcrgGqGxbjNkpSLgv+BO3JdUwH/42DH/j5vFzRUMQfGkkZhOtwnTNi
	PQEMXJ5hjiBnHFxfmueII+yPWoDGR1soIGFCCu/6eYjB5YkKlGtiiQ9MrOFP1h0sxpEl4iE6iAd
	f+2qKMSDid7JcEHmXz6RtK6ErsarVRm8WbWiNs4UeYjMaAuZ19gISBEp7TVvHu+A7I1tGp4rY+4
	/4zTB1btmOcPh0ca4joPglQ==
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4f1da24ada5mr123993161cf.16.1765801995486;
        Mon, 15 Dec 2025 04:33:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEolfUqhAvxiCbRlZql168UKfAxUzT7uQFWVx2bts3/Oo2pvmASZPEehhVJCf9YXfsm+8YuWQ==
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4f1da24ada5mr123992651cf.16.1765801994844;
        Mon, 15 Dec 2025 04:33:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8d9c6fsm186623355e9.11.2025.12.15.04.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:33:14 -0800 (PST)
Date: Mon, 15 Dec 2025 14:33:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: kaanapali: Add base MTP board
Message-ID: <3a26r7uvvjvhj6cajkt4rmipgp2cgqrpxkqhj6bsu4d5husjlr@yhfvhe6mndor>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
X-Proofpoint-GUID: _YxcbWl_3yT7ztROwq_Yo937niSEq33p
X-Proofpoint-ORIG-GUID: _YxcbWl_3yT7ztROwq_Yo937niSEq33p
X-Authority-Analysis: v=2.4 cv=G9cR0tk5 c=1 sm=1 tr=0 ts=6940000c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVI_ATdNTQjFCBPYYL8A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwOCBTYWx0ZWRfX/LG3BeYHAHL+
 Te9NmRgJPhN7XSZDFPzJm3KHaIVyMDdkSvLKvjuLo5QHgQS1YwUHoYlbdw+xdb9tCX8exOZTjv/
 +Jhzk9Xa2ZIgTOktO5YrmUlXkBMgIgDkBTX1fQGnsBmWNbrDtm2luS3BNjJl7qCWJlqaEdPxdvB
 j9oGIPLiMozXLXIgPqf+OPoCkCFZyCvIqvZf5m8/pGjaBndqoFKpqQv3uKv2FqTSHXDFrKgGrJ1
 TC7xcDvsH/G5+h4dvrN5RyQdEsA4n+T7neBA/AZKGHa95DPaIJP0TEsJdtSfq436sdzLXFTKnDM
 s/jjTxyVnYAPskNbvfkNNa5dYwgpWhSbUvqcmzByBekvKNfdUqQjEf6k7z9uOMdFrizpvIcjiQK
 sjMw95FJmzt1/WmX/TpFZxIDrHeTrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150108

On 25-12-15 01:07:24, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali MTP board which enables PCIe,
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added UFS), Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

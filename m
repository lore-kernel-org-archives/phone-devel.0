Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208002C3268
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 20:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967421; cv=none; b=GeMwQ+Tpx7bieV9WftiW4zmFIxxkkogQHAWUrXNjY86Gaezzt4z46jWmyZTxwNiGUXRKjlygAIZ8XEc8p1wSWBXny8bKEMq2uOldCmH32RVFVYX08WnVC9JM+3ay7OTXjge6yYNzDiWlHXZZuRkdnvK21b5N4/1vdHe8ahxubYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967421; c=relaxed/simple;
	bh=lW8pfdiP2rqCjWiVK61Prl9HMRzwg6pBuShtl7bVAo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4duj236VBqr6f99rRSd7uQCgR/Xb63jQrwmr4q0uBtzvVeSWongoWFn61JjI1hhpU3lSpTNnFPChb9qwlnsnlaHZ/La0PvaIhldvEWOn89MG/5xuWRu8LSq+HJ4FlT7REZs/RXbzuNao3xvk20sDs7r3I3jv4LHGKrLK0716iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ/NNxUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7xXM6yQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ/NNxUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7xXM6yQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBO9h1255878
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 20:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SSKDHRhQBrHnQa7ewmYXepBa
	EebcmwpzdbbMbToUIj4=; b=PQ/NNxUnbN09+ovtjhBZNHbaQst8VsDxQQ+56+JF
	Ift1iCduZfqYHoyL6yS04OCwht0jDsNcPWwlPRosGwJHr5t+bi729rnyzIiPsEKK
	Ml6O6p8TIY4rJGjo/8aYQYBNGSJFbFZ54iWIH1ZnLG/Dumm1RxIw1APgB8mNUfcT
	AjpFCtYMjOQIfJwpgBEAiytkK7xb1r2y0/h9XtQacbYSl/hKjUSVlyR5+A0aqK7M
	VPg5hT9PnifaAMkiFdIQIESjXZj8PP3pgcr36vkB6xrSipC5euMtVhwEG+FS/n1f
	9X00rfStVrHU72usaPBii718WFItqTSnCxNVSj3/ZQWVJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj3b3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 20:43:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e9b2608dso423557985a.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 12:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967418; x=1765572218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSKDHRhQBrHnQa7ewmYXepBaEebcmwpzdbbMbToUIj4=;
        b=h7xXM6yQSnYUGIU9o38grA9H+QkohbvJi699nuH9hPjlhv5BW994bNmEtGfv/9IXl+
         ZVtoleC6Ep7GI0PQlQozcqaa+bBESp69BjWGaDJji0dX1ceBjbmTN39lmCqS4EtEqWPw
         BI7gUMgEmnzcACDQUxYRL2loquisLr+JejTBV5fIAxBJuCHNrlXm9lQYqeRq3cBzYnZR
         2iSMLBE/I7I097z9oXGCYxnuiS7ZhsxQuno6UxJi0SCAB7wOdrYaLrkoPbmKAp/g0jEw
         peVmw4o2ax2qVAOJfiKyX5O8qv0BmbTmhcIkOwsihTUsgqvDgxDzEXyaXj3F9Y7AHVtl
         0/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967418; x=1765572218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSKDHRhQBrHnQa7ewmYXepBaEebcmwpzdbbMbToUIj4=;
        b=Ryc8eRl6lx4aNRi2P326RgaO0IKOqV8I9gDMdN0U8ugCqCNtmeBsaL2Iee4FlrXPxw
         CMHxFxSPowQ+smExZI83l7lfd+rH3BkI3qgJ3KbAqoZfJskTM6IKKnQ4JTT1yEENQ+Vt
         Q5xC4qKW/CABvMb/SRrMYWsVL4fbUTxk3tAK8ZqySviv+sHLx45NoPE2cJIjG/9GOqtz
         Fdwpmbo4YOU7aaYNjUChGh6nHwsQQ2XqO2vKSFXs3xOA3+nkYRimQYLUs6Y98kv1Xi5L
         acvkLpsW/MjGv84eHN1qGqm5x/L7MlpKgvr0Mekua9ofQoYiI0PU5T75oI4oV5obbj9m
         oOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+XbquKoK2eR2WbAq5U/82NUEB2zO1xDU6uDBwKtllJ5H5CiqufQg93FmvXreJDDwajpaGaZZsWW4j4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbB+F5nUhyzjSDQN2pxcfYx8aKU54fYvMMjQQI/N0ntZRYMYs
	7pxzxdq/Ovr6VhWYsvhqQ27FTGEaFimia20WSqEbQhVnvdQPiH6poLuBBG1tp9rTWiNOrpKZTuW
	RBe6yWFTw5RJykJ5oqj67twhINXDBsMUOvi7poY1L8DfQPRYwtMPnbvXZR1QJnAngQw==
X-Gm-Gg: ASbGncsGSw7n+LZWR6NSyp9Z2GdKA46HBgQ6fAFZPmmiMbr9uCWcVnhVxKUnZ1ArvRP
	3pOjLILUzeqwKbiKTnb03GgQelMyP1fZjz8LAnv2s7MsIJq17385uC+0MPaelOyrUpuukzPp4gQ
	FfWiT+IQysvX6BrvnyIYNkxvIegPBwVlnn6toPWlZNr1fqT4R4jlPdCJTglP939ZwrYKHfZ4uDX
	qvPma+XGgPD1dLqOTEf1Cv9fu+f057Kp8tEoRKcLC/cSC2YQnf+vI3T5K/N7GzK7usg6bS5TU5u
	qwyq+nVPTXZb9I4fWYobAkuyNfAQ4dzbaA434YzvVsCIHGjVN3+bbAeG9SqvjJjmfyIu5QUrhk9
	lc3IofLvM0U3IToRXVy4wMUBscDU5khaIcEtOPGzArRc6TR2s6W/Caa/kXcj1MOxEOsbKBdb7lp
	26CIYvhyRo/DJEf+JHEaHqE94=
X-Received: by 2002:a05:620a:46a0:b0:8b2:d7b8:f3b0 with SMTP id af79cd13be357-8b6a25a19edmr42094085a.86.1764967418152;
        Fri, 05 Dec 2025 12:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTRgN5ZUEZkY1b8WJZPpsGklBAprd/UjMeiOJ1LdSEyw4kabifHL8fhEq0OKbQq1DZzuCVOw==
X-Received: by 2002:a05:620a:46a0:b0:8b2:d7b8:f3b0 with SMTP id af79cd13be357-8b6a25a19edmr42091285a.86.1764967417668;
        Fri, 05 Dec 2025 12:43:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27fc8sm1781915e87.77.2025.12.05.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:43:35 -0800 (PST)
Date: Fri, 5 Dec 2025 22:43:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: longnoserob@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust
 firmware paths
Message-ID: <472c737fe76nopijw43id2sxvp5kjp3oqlxxdfi4w4gvjl5fxe@ofmvjpef5rnt>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
 <20251205-slpi-v3-2-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-slpi-v3-2-a1320a074345@gmail.com>
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=693343fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Ka5gzmRM-CkgoRBa4h0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Gd-l6coj8EJTufbNdJiPPbc0lJMwL21p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NCBTYWx0ZWRfX2UKh93rsw/zp
 7/JW6hAtDeDAL29o4lfMDdQ0irIs3a5DcdweXsXnNd/7akqmEcrK/EWK/IDl0+Nvbg5iuatRlMs
 ixJevs1IqbCgKO41LLai5gS2djP2+aW6JoHMEmL3l5I2cgzSMD/gh0RbznvwCyIWn/EbwGncbB7
 GNxk1HhMLFlEJ33xXpNiGFCGVOKKrmPLW1nFj/Ddcj6ONsaB+n7yFAzxiEkhQ4KiMbIc6fe4R9X
 MWf5YXVZdKbPsP870bglztZNtZefduALIGUTTby+xbwpPrk5GID99Kn8iyb0qac8iD4eDNKjZpa
 HXFSWPRBKfgA9UhZTfSGoy7/LzL20n3VtTBs3GbkUnh2/8ESZKSyXUQgc27KmQc1cvTlOXUNci3
 3mR+qsbjO2P7Sv2w8WWGETsFhncXMA==
X-Proofpoint-GUID: Gd-l6coj8EJTufbNdJiPPbc0lJMwL21p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050154

On Fri, Dec 05, 2025 at 10:59:00PM +0900, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> Firmware patht adjusted to include device maker "Xiaomi"
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> ---
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

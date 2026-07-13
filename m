Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7153B14D2
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939549; cv=none; b=kUksYBbJZKbXpG7+nTGm+t58cb9Be+LC/ceE7+o0oknIlMbuyvHRjjLFvH3yOasPN86b8BSklIKSGnmLE7SQQVsmY8ZwNfSDVCdKdcut97VBdhfboaRL/mggGjA+kS3p3XhSWm/X4TaNOer1XAfd5hWpfvCBG3TvyaINEo5VFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939549; c=relaxed/simple;
	bh=fADMqcXMSC/Ew41QhBvx7o+es3Alyu06/NrBQ8KAO60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COkMk6CS9Ra0LS2872bGWeDeyxy18zR38ckQRm5wfkmEDxJo3N/KdHCPycdO9NUMA2bBvpEtA4ng6yiJJQtNGVUBwuM0RVBNFzyhKRPY01rNHWyYSPbu+Z0BgLDxTC/uqN7HcAnEZvl79xaUNfi7MdvjxatsRuEHeBvS1mSAUhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MP631YeG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7RlY8At; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MP631YeG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7RlY8At"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dWrp952929
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dclPyiXKhE9kf8fgUPzwT20RKnTx4EIwm92ppNGiSQ=; b=MP631YeGt0YwkdFg
	Z9E0q/dqiz9oLvzEwq7BhyIDwtoS+hNNUczdWdKYrDg7WxTqoAxJ2HHY/ELWoigw
	zCDsOXZm2Y7Pvu+PN1kqb2u6jPRamGo+z5pjgDGeJ+yGB9lnYdWwg2h7qGShWANI
	Mc1D7KA5tEC69DqRukeDaTLnIs1YGvJ8X8l0A3y2UNr4AP1IRrqFWZ4uhqApdjzn
	7v+IbU9Pf7s5Lh0u4xNpvv8cCVifLTYr6DL07Ow0NQnJOjPXOx8hMlSa9REyRgzL
	mgM9m0SW+by45w9bDh/nvj+T/D347xhKlGVcaiBGF2N2N3y5RARm+oQ0A62RuV4/
	0ejNoQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g7js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:45:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ead919557cso10252646d6.0
        for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939546; x=1784544346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dclPyiXKhE9kf8fgUPzwT20RKnTx4EIwm92ppNGiSQ=;
        b=Y7RlY8AtFSmHq5Ebl1zTUk8Gnoqg8NCXOQWHZ7+6xyDRRQsEvRHzeSBkBXSu3aS2FF
         1EFsfwuP8a4cRyYjrb7INppCn7IbJK2sRY2jZSXIpa/Y9/U65XXqe4YJFZW76YY5geqY
         sNMLF6Fs5ts0CXDJCN/Ay+FtWbxjHgJ9oJ6W0upvYRGkao4Gh1MnETfVZQ90808X36gD
         rV5uSmCwTHnU/myvFfMgdaNvTJ2N4tUxsgm76tiR6i+e+A5bgzRcGY4Q9IE3r2Fgy+Zm
         oD9Z1aG+mgn1JkS8QJmmtPkJGYsVVSZKm2209ts6eVCSsXMjOiI822WPtAWrtMnxAISG
         ozpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939546; x=1784544346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dclPyiXKhE9kf8fgUPzwT20RKnTx4EIwm92ppNGiSQ=;
        b=GTM3JzD6AyfIJsPE3IuDHhsJ4N71W9Nn7TBAKWM6ont9Byh3S2PogjfkvzHi04kw1p
         d0iGhx1zcOqpppssklraKkHDb8+QIF+gEeu2pNTTbtkx/+eN/unPQVRjSsyDkHkvUb/G
         VCKVk0jlWvEyFwA4bgW4iQ7yvGmnVvqHN3GQDscIekaF4qAvLjCtslTum/Gjk8j48/qf
         D53UU3ufgl4gZFC8VQGoeGG0KIkLvybZeu9R76wxhtHEMVCmdKxYQxcvLbdQp0neqeeH
         qzhhD+xUAC37chgouiioIFKPsRvZTGPbcPj12fVQpXawn8vtdEYWqxNcCBiR0YW0oOGR
         012A==
X-Forwarded-Encrypted: i=1; AHgh+RqKEy6yWlYzcWnVjhBu5iI/LeW4+A5fI9zijHl55HVJSKjCVTPmRbJcqa4RvoQYHcEGjVhooIU0cXJMTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw52LrFBUz4vSV8ewzXc8113nTPCsTHOAzVSeTx3Ow36QSSjEKX
	Wtx2UMEIVKnmHVgGzWg3qnzBI1ZwtET9YvgWc5MMirZnN79uP5v4RgHbOLGjP9dhJxwFgUo4/h6
	wPPQQIjj/cbQgi5y/G2LN+cSs1DtiWa272mHZgadXaCRVlASymtD6gZ+sp7+XtG1rhQ==
X-Gm-Gg: AfdE7clXFlOhweNfucH7co/s5ZmLuCxjnVOnop1VtWg2knoCY6SGy0/XgATnmsuR3Ub
	PK5iLaAbPaCBMJrzEEQ/Mls27meuORTyD+JplNRwgpRyuNpOT7AEFDz3tWS5m71Cyl2ryotzfNl
	21nMlLv9S8oRB2eVP8umm+lbk6UpPsYiwOCwENYAhHukQO6Y/haFCCQVmbkdiiVS4TJHNvEkDBl
	Plor0h2RYzyfuDjIwzv4EXWifzYde4zP7OsqSOa9NxFMNHt2pML2EpukegU4tIE64wXOtHdhSW/
	Upwn5ZL+UUE9jnM8M2Ms9nyUJXMp903t194PPd2YpZp4OnxmOCymt4ZuBcUjYipXvo7SNltON5u
	OovLQqWk9StTYo/HKNPTU3vHWZKQPnIZ1YxQ=
X-Received: by 2002:a05:6214:509a:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-90400b8241dmr88673336d6.4.1783939546355;
        Mon, 13 Jul 2026 03:45:46 -0700 (PDT)
X-Received: by 2002:a05:6214:509a:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-90400b8241dmr88673046d6.4.1783939545990;
        Mon, 13 Jul 2026 03:45:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm14502495a12.3.2026.07.13.03.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:45:45 -0700 (PDT)
Message-ID: <4b710f77-f06f-4a2b-97d9-7c9b600addae@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:45:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8450: Add mode-switch property
 to qmpphy
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
 <20260711-sm8450-qol-dts-v2-2-5eb2e86468c5@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dts-v2-2-5eb2e86468c5@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dws4deEwfRveZqEGtLVoWL14LEiew2Ww
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfXwa/IlarlJdc2
 BLgoedX1v3gROBa+ket7foC1seedwU3Srxk3H20HJU4OHWfm/7z8TVPGKVQnWv/nk6FX1U7snsN
 DRVPsCaXb6aG+e+3eaEs5j+7WjCIyIk=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54c1db cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MPnVelzrJJpJSCPv50MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX9owXOMxKJJoH
 G+q0Frd06rUMjTholhsedmFgQL1OYE2pihiM+B167cU1q39PLg5bz1vADL4Nf01nlTOu8hcxfm+
 o8exGnFOlDDK2fdjEfXtFTQKgUhPNHRbwPTWCYOMDA/B0OqH3MyFeBDg6Iw5eDbK5ou/ukwP0pM
 Bv/MeaVDsVfDddgKHJxWw9+bKcTF30nc4q+JStuofFF8QCmxNqzVuQBNEskj4RLjIALSAiPpB6A
 QYAhqFBAqZrmWHlLRsEDQbYX/Ivvhwrzq5BGERMG1FyRQHjEeS/04N06uM6vvOl6rfkMc+srD1y
 8wUJc9eRa3T6Hu8d8pQ+oUPYDhhZRSBmGb7a0/7EI7lAn+wbvvB9L0S5ICqVFnw7yWVJOR0t1DG
 epnv63mVWv1bSmQPxmjwL87D752ajOT+EJEbt6uzR/43MQJKYqWbQJEbB6QX7lyxmPept4TQW+7
 ptQ7o4HBMNgqo56lw5g==
X-Proofpoint-GUID: Dws4deEwfRveZqEGtLVoWL14LEiew2Ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130111

On 7/12/26 5:12 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> USB QMP PHY is a possible handler of altmode switching, so add this
> property.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

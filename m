Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBDF2609EE
	for <phone-devel@vger.kernel.org>; Sat,  6 Dec 2025 02:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988979; cv=none; b=m06w4X9gB9nlaae7lBvZCnVxbFe5a+fvok3ORRwVz/AQbqBR24CRFUSXE6r7NsRKxMzfOVkzlnhlBG4Zjl88eVjeyg5rL+FbwWZRuTmVIzLEt9BH3OiInSTM5+PjNUU0u+c9mbLxQIKdt8VN+TB27b1xoeh7803P6ZXWZpOzOqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988979; c=relaxed/simple;
	bh=j/n/Vl1lqc9OuMWdAVYatU4woR3YW0GrXvb3t5VpaDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSYn/3Wvm1NUnGSU3amjwk4scqpyNovJDgwCcMVj9DUR7juE7iGavwF7I4uuA0FfdlHjjKhdmWK8iTsoS+W1fHXLIJnFVwW1MP2LuZn9MGJWACHeUf04q9ExMeQ7Olk2HdkMf3lm2THCEANDCcfomIilkI34f5wW5eQ04YWNBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avPYM/hY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rix6Vr7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avPYM/hY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rix6Vr7B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBKpa4177171
	for <phone-devel@vger.kernel.org>; Sat, 6 Dec 2025 02:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JXNS2h+C1CfMyPBfhTqPN5Yh
	cMbeULYg0Yv7h8amnIA=; b=avPYM/hY/EoK0SRTlFoEohREQMYUuV20TKCIA3Mg
	KyufPGqXKarosbOlFn3x4H21hs20fEVoWzamE3+3MZk/OVByONerEm9IiaBxJ3XF
	S/m3scUa5oet4CdPOVIhSS+ps7nF1P/ihy79AgoYNE/yZcPYlUmHxubemp7ZHr0L
	95kezTCEdqv6z1G4UvNNapYVwpifraqLDDf5DAnNM4ifyWHkSRqcJoozO5p+u1Fp
	Vq3MMxmd83bT104R6ZSP0kAMGck2uzqYzJKDAYL7uA0/LZe+A5pwnYri5+eO0LLM
	DhXxEDYxTz4DkWn7uc0Qf6LS/LLRpdeUIIxlc0MmBMsdPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm5abfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 06 Dec 2025 02:42:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e2342803so604484285a.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 18:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764988976; x=1765593776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JXNS2h+C1CfMyPBfhTqPN5YhcMbeULYg0Yv7h8amnIA=;
        b=Rix6Vr7BHz4VhLRIQK1Y94YmiubTv4JWwM8ZQ79GMc8/zzfFtNc9qDfV6vdgnFPvAg
         1ciE/tEKu3kgkJm6nYRLpWJY9l1LoHEbEJ7qs4HYmaOBxeYn8EpAlMJofzG3wH8PVE34
         o2PmZz6K/WE4YHBjo1AYvzXrn4jBvIsRLj03pym/UkxDftBc+1ikft/OzX5mOhvKC04H
         W4SNKgl3oQxWdYy/4UE9n46595v7cz/yO5ynesHtImNJqHESYSLA/15EJWfRVETVR9ZP
         IfVotvmPTdSXzxTdfec/dJy6dSvdRXUGqp1abpvxdCoMHzx3Ey+Dwf+55raOsKp4gG9y
         Gr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988976; x=1765593776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXNS2h+C1CfMyPBfhTqPN5YhcMbeULYg0Yv7h8amnIA=;
        b=swh5VYT6yU8Co5b3T41P5JldB8tk3Rpt92SxoxT+VKgX1wb5qa9lBPLN7/dWJ0u/bq
         OyZalOPW/soy41JFfyWD8oIzwJ7MqNH3FHOUQzSVZJuRgPpju+5vRDBTsykZPEhmbuUE
         RE0uZNw3zWkVjZurj8TEYrTu84Z/Qad9ovReZph8JRVVznwm9W5mCkFPGZ+gCFQIlg2E
         mRb62hoKN5eC9WJYSGHxNJgHAVkQSs13fcuVliQ6wAO32XUP3L74jTEf8W9Jm/OGZWvq
         auDuJZ115dSZxfmczP2NS0r3pTkQ546o+q56FYRxHDrCPFUYkoa99JfP68zQyWr/djmd
         ikmg==
X-Forwarded-Encrypted: i=1; AJvYcCWdX03QIg9cc1FZADZPlEgCHPGzbJ128cFTFMpvYeVCZsMAewhlxSfsZZidOst768xwcKFJZxGMGm3Y5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KRbbn0X0GaF9G+KDD9vAgmzi4d0JfG0rEv0BetjaYIL+HwBj
	e7V+h/LA+9RY1YAXA1cNilNtQVWFEVlpU+aOBvfpR4PZFMTrIuhrU13o2GfoNWFDYJfFalIsMS+
	iwTOn5+0EMwRljtaaUu5Gu1yj5PAWtAkY3DSSA80Jz/OxHUTbsy2oNb4zHmrMJgSzRw==
X-Gm-Gg: ASbGncsvIicSSmL232k1fVMTD7drTiBOfwqh64h9T5gP7uwoxe2K2iVepjm25xIhICr
	JdbgllmzpC4tbWI1bptrxseL9T+nu1XO0yr6yfevGvsmQVoKjsHRQJifBoNb/F60sFv0BzBSZYF
	lrhnRUMctwMJTik8IGy0YITfMjLG+86bqoSZfRg3RvNcKrJU6NVx+kMZ9E0jaaum1N8uNqhDMyc
	Y49+PlE+o0e7Yt8NpCphzIGAeP65GIMNFpyovyKn3Gx5ImNk9/FbkYqT36rRcc/fdBjfslu8vp/
	yrb8Bn2nHtctO2zYDo1Og+P39sHSLGKUE8mrvCD6No8Rq9Pg0meMGlPIeM0mBgq8AOOXbYFYASI
	QIWx8HKzWLf1yGIP1vltFzsGV++u7g8gDoVkQ9911vD+2yp+6iJ2WJ/xW6JWJC2qhIoqFRoTgwN
	IEWbSLkYsY2DVJ3Ypp+UXPWSI=
X-Received: by 2002:a05:620a:bd4:b0:8b2:f35c:16ea with SMTP id af79cd13be357-8b6a23f8f61mr187252285a.80.1764988976599;
        Fri, 05 Dec 2025 18:42:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg8/xIaujUmvsPLL5MiJMAjDbuHUxtjE9GHH2cSrDU8i5syimspdy5QjebVARVit1+o7Pilg==
X-Received: by 2002:a05:620a:bd4:b0:8b2:f35c:16ea with SMTP id af79cd13be357-8b6a23f8f61mr187250285a.80.1764988976204;
        Fri, 05 Dec 2025 18:42:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e3e4sm1988386e87.47.2025.12.05.18.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:42:55 -0800 (PST)
Date: Sat, 6 Dec 2025 04:42:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
Message-ID: <jv4u6nr6gembn263xzwsfou7lgpqtvl7q5temfiepopc3yvmpp@xn2uelts5g4m>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
 <20251204-knp-dts-v2-5-596d8398c6d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-knp-dts-v2-5-596d8398c6d3@oss.qualcomm.com>
X-Proofpoint-GUID: Z2HboH0iUfUBqULPrviQVaXuui9B-EmA
X-Proofpoint-ORIG-GUID: Z2HboH0iUfUBqULPrviQVaXuui9B-EmA
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=69339831 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ii0bGMNOlrnFhgTP-T8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxOSBTYWx0ZWRfX5IeSU3yxD6PC
 qvlLIzM3yo/Q0u6kceo46N1LcjGHoq0+GeLmCEJdzwbdZYQMRSP1D9qvDopK0pykp5wBs8K0FXG
 Fc4ygR4uktxuZ21rURuEUL26VZG5EYBzPDCYBpYcvwC79RM+OJ/dFXMGjy+Noq0abIwpbjQRcZ9
 rZW78Wk7MuwyuTgMxGic2zrovXPCmQh1ON3RGlbk/aVFKlTd2JabCWYLWETG01Hgm5CpHUFDR60
 3ooHYvhIuDUl4L7CkAEzRWbmVd9sFeVBQLbcV0P8GO7/0GAheMUthO4cBRT6ORHt23GJoEx/bUe
 xKMfijr6I4wBcpyqLoCAm+TFsqlQIOgsby7/PDNtk8sQSXKTqJUoK4vc7WLpj853BtMnMgeJgMj
 nLbO+lwVr3btS/veDiIPnPHEfrrGUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060019

On Thu, Dec 04, 2025 at 10:31:23PM -0800, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali QRD board which enables
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added ufs) and Manish Pandey (added SD Card).
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |   1 +
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 712 +++++++++++++++++++++++++++++
>  2 files changed, 713 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

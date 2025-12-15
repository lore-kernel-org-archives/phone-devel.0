Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8C284881
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802180; cv=none; b=lCFjzMZjuHxSmLm6tNVoGGJ9d5qfegbn8IEFzjaSkZwCpQixNLyikllxxr1Z5RKs3vfGe5Er7f3glZRyxCIeOyIA4KHn9DuTlrJSWWGObEKNM6oTaApOaaPkDXx64ks/X4TUprBUog2puXXedF9vrznjpY6mJhmWAB4pHvVzNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802180; c=relaxed/simple;
	bh=yA1XqBdQY/l3cKpAxxLkvw+QusVrjputVquC1aGUb0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikQ6LOlCc6wLtP7jVwBVGAIoczCEWTvNyvTR8BMr9wm16Vkuab3n4C1wVk9bX3r8vYeETFr5Cn9CxABTKgJxKQAUzpZNhXIf0HnOENBrIQeBAMP+tfMDhBEAgqKCW2LTw4/dQx+Sbw7vn/DBc6J6f1n+Y68xdxkLvXJZh8vo5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvUtMtyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/CONo3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvUtMtyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/CONo3Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFB2pEk4003464
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 12:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FxMSxKWmIQqSkiT0adHaZN+j
	fSlVfyD72OviIhDO0UY=; b=SvUtMtyz8JW1NPmrfHLsWhrFOfk1g+QwZZ/HOB3B
	eKG8vtw2j4+YtiuOzNzy3x0I7NBvbfMGD9y41ygPQ+JbUcUXju/B2fUE1L5N6kPb
	FQjdh0KLBBet1MNH2WXTbUGsiwoot2lqq1W3rBVFSbFGaizUGbNwfBm8A/QGy/6j
	Mw9M0dwWVmg30HJEmF0l5yTW3d20F9SVvFqLfV+LSmX0V3cUp0F86P4hT4jia5b+
	6XLjMKR6lFU0ezDo6JU+KNv6rQ4SnIqsTKpccCbHlcJAsuxtqCOPVhmdt6+tQeRf
	S4EOARmFyKll6kZ1AA0sUfpOqjrlbn3ztA84jQY2X58CZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2h44g7v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 12:36:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed782d4c7dso59478271cf.2
        for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765802177; x=1766406977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxMSxKWmIQqSkiT0adHaZN+jfSlVfyD72OviIhDO0UY=;
        b=H/CONo3Y5Wzj2pz4ohwa+hewgPYWxi4cECKIEUKlNrKG+cvmjfXVzMl57GBGPnITUY
         r9ii6xNCmq6eX34eJ1ZJa1tb2uO3dDZAJEmWJieDPjS27flat5fGrBjgR/trL8ChCkcT
         5iQSR4/P7zchr+UZyCzYFXIBCvxjEJkuXIcDXKs36AtF18gZSOdNtb7BMToWGKyCBcAj
         vzKsDHoWTunqOtTAbtv568SqK93V/sPqw9OPM5JiaBNtYzwnbEtd9aNDQzjYgakruPd4
         NPpr/SfnUXOcC76toGohksCcDK70jcAqGzbZFZ8S4F5w2hMwqTz1jH1Sx2FZccGdqJba
         /S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765802177; x=1766406977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxMSxKWmIQqSkiT0adHaZN+jfSlVfyD72OviIhDO0UY=;
        b=Lr7/G6rHBZaBLdCaeDJbBydyxE9vOhU5ECAUEGWDnrS8/a8OwCYz67BRz8xyJ2PXFK
         uHLU//sTEfB+c0+J29z0UOFRRN528YcaxXvhfD6ZlGAgdVDdW8QUiTDYDriPeoiFgqbr
         mub38kSB73C053mGi/HwTZisqyKyEp0UC36LdSma4F/IjfL5q4Bpsy67eyS10nB1E6je
         +MtTSuVlEN2doRleWkA1pdW2scyd8a67YQbW3zN1/G6DBqhLdcxqbm1qYl3vARKh0H0n
         zdV7/2At+sIIyDP2FAu6o2a7pTlagTRVlD3yPI67oq6NHzEJhPSNb0pzjgA5zR1D+Stl
         vUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY95kq/GOTwrVYputDQl3u2httH4LwbcTQNFQc33cOFZVsdxqBOWyGKFcYAEgqfPS/fL7NThc6BUDbxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZopSedDwefkjMo8pVPSyxT5UMo4VSVdQlWtyMFSoQw8gy/vAe
	t/RLha9cWOFs/ZYAFETm/Jq/w9DUgyYtluRSk1AYAVRl9IYa1UhDMXh4pCdnk2gC3nagIkO5nX7
	PJiii2unXSbDlSExv7Uk0PdDp0yz0AJ+Ww6C+3S+sT0iZ7xYNYxzikfVZV2cHR0f/DQ==
X-Gm-Gg: AY/fxX5uvsJ/75itMr3CX1/cA0TIyxHyU87ZW3+H/KPMfT08Tx7XTjI+XQZLnqGpAEA
	WISj+vn9yCeFcsmqjtVAX7EuZb+RW/GKdMFWWJEH+eI2DJPqgle7OotGKXFHhipN9mJmV5mMmDD
	W79ocuKqUBFmm9j3pAPvv4zhi3+WLvJ6NpVFfvxVQjkb4McVvizaWR0a7KiBe5Rjasn34aocgIn
	oCEydf5OLXrJRcwv6TgHhX6zx3IL4F2vCEINJmfERunYGNl/JcCdO1WsIrUWqYTfsl/IM0JqUYw
	4nkwhTr4pI16UqVj9UxJUxDc0yB0nc/lF3/6f0UeXY9eOPVpd1Rvnnr7f9QeHv+bRFB5RLGNW76
	KAWapl4emxM8GmskcWHsL5Q==
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr135743101cf.56.1765802176526;
        Mon, 15 Dec 2025 04:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUMQHfbZ4VwPbph3sBUvkMnjui9TESiMXvuk4g2I93L2wpzSiT/pk3iuMNmhsBZxio2zTOMg==
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr135742721cf.56.1765802175890;
        Mon, 15 Dec 2025 04:36:15 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe55asm16747238f8f.41.2025.12.15.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:36:15 -0800 (PST)
Date: Mon, 15 Dec 2025 14:36:13 +0200
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
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
Message-ID: <4p3huithuex4mwsjxtoynolxnymqbwj3wp5lw2yeet2zin5jgu@4qqlleqnvqwq>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
X-Proofpoint-GUID: o1kfGbVkwYSDnbrh2zx3cez11oc10A6S
X-Proofpoint-ORIG-GUID: o1kfGbVkwYSDnbrh2zx3cez11oc10A6S
X-Authority-Analysis: v=2.4 cv=G9cR0tk5 c=1 sm=1 tr=0 ts=694000c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ii0bGMNOlrnFhgTP-T8A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwOSBTYWx0ZWRfX2APFzZ7GpFxz
 hIgnYjatdJX9c8nTTKMfkC1stffcNc1NmzpFKgrzk9Nyaqn9f5z4paCNWG4GzvVF59hbApzOmYe
 NujaKjYFLYvNl2Hd0PbQYAw7BufIb06TvHce75j7qj1maHLfZ232mRFvhU41hvMlxwf+0YjibNb
 aWfO8Gkij+/ybSnWcnYiQukRYY7w/ziY1Wx1ZtSNKvLwu8zqNH82KjSCSsFZxbAOP6qeXZOzMQy
 VC7azs/b0cQepS0GF4xmOvB7auSpYaAd+GLkJP7VnF/4qTWTCJSBlotCTT/SfqsFDA8ElovxybR
 COKBR9WrAlPfOENMk5vWQCQ5k8aaDIY9YW9FmgqBi8yxEr00m4b/ZzYubOboHcR/E0KQGUFm3jc
 t8SMqLemIGwBVDzvTDF04pO+1PjLaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150109

On 25-12-15 01:07:25, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali QRD board which enables
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added ufs) and Manish Pandey (added SD Card).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D12D2495
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 05:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773033171; cv=none; b=CneYNLiTQaCxM3qq7ZN05tUxVqbcZ8IZ/5RaTTtTAkbJ91wDZgO5x9lamvD5EuL5gSi7GZNAGd0cCJm5V1njlh6aQdPLwUsHA+KKftwTvbrdiVRvy07QT3zOUyOuXSdRYFZK69hPHVul1PWIegzWZscpE/p/gxyOPXWayQHPH7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773033171; c=relaxed/simple;
	bh=oWx7RRG1m5AcqND2F8ZlwW1HBlD7BrS6vCGSTyqaDRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj32nXR/rAm9yZ+3LfcSVe4/aMher1HIA+1zC/NI3C+Wh8Nierv2K23ebsD1CVwHgzIN9/WBUvnGuYy27Q5mFbQHa/3af/7vuQxyE+0v/3YAJ/GHSuTCpwvV0AvWxpRBCmucKzhNXCaonyY0a2DltwPJ/KKzhOHGiyr5FEqndaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivvsFJFo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8o/KO4A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivvsFJFo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8o/KO4A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxOrv196574
	for <phone-devel@vger.kernel.org>; Mon, 9 Mar 2026 05:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKuOK/Z9ewWumYHjX9jmi6qJ
	5KK/ehtHNSnD0EqSR48=; b=ivvsFJFoR3ORmo15BqPkdA5fQwVIkOt0GIwapQIY
	cLSmEmlG2G+HbCMJQGZLT+h61JNcc0E+rc/WO53M6CKY3FEx5fu4RKJhDbTNxNGu
	qXY6Fh9GbswrGBoJ9Udj1yNvcxYyJ6cCJf64s53VNV4GlohgFsF7lSHLi4umBPmp
	PHQA4ZWAq7mLaTozeOjAYJhchiPOUi1alpPVvLchQZcsWvx693r71rZ/IvFcAuN2
	Qd1sfo3p6+l/4jTi7RVxq+D+Anx5Bd1lOjmKEDSvttvf23qbcma8m1gJZCdQmZTJ
	jQRLwygSIsmk1YDqYQVzwzvlHqX5NNieFHdV0UUFZUVVwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vbw81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 05:12:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7774be64so986333185a.0
        for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 22:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773033168; x=1773637968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKuOK/Z9ewWumYHjX9jmi6qJ5KK/ehtHNSnD0EqSR48=;
        b=F8o/KO4ATFHY8KqE3DghjAtK7a5E3yM6X5iPTLSieHKO5Iehpz+yNa0aYXShlz87De
         3AQ0SyAmZ78naD+OvAohCIuM85K4jD+LKKJHppFxgJ3sMwcNsV7rhKGGD8+l000rJgIc
         ES4ZHTeKDp4aEvPgEQCEQ6kc1N5c4j7rkcxFcbwkbbYPOqly5nnrY68ZdNGQy7jRYDoq
         jQiv/G6vwK1MAAADcRt4/HvU7a3jmP8AfYbl3dnuxoyTrsBi+IkkQ6i1yHi4Fd8YfQeo
         T3GzEthqQi39SoyQbC05o+Gbj8GXSj5RYSRSqCx6f8c0E0g6VH4uW1eqzxhcBEj4pBrP
         /mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033168; x=1773637968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKuOK/Z9ewWumYHjX9jmi6qJ5KK/ehtHNSnD0EqSR48=;
        b=XNZwnhgqwZGrNM3udwQoxdfRBml1W2gC2KyyaS8LvEjf9TxY+UvdHUV8UJQEBEKV8T
         K4+Qcbn8yMRIZvZj8yBenoA4jLnOZAzQePCSW/CeS1A+1Qr81eOnySynmI0K+jmm8Owc
         X7NhfAc18qW1T6Rxu336+MnxpiEZH0TkVuMkfOdMSijToGDd2TbuqkjvzEJ2gsnKt+cD
         dgTrRQfGmtX7KVs5fCy7DyjEknwnSjwz59K0AdOdQtEK0iQYVYgrgbnJM+/8UreQe6V5
         MIwZPnqTzc4ccjkqyWYIXybP8HHeF2FuJxvHEZXIhMJvoZwtGFmZwWvkGdDEOhcC0HiJ
         4VcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMGfbRGVx5pEA+mGc/3cKhf12K42ZPPIYmyvlviVnAH5KNgSNnGwwuwj2cD0qhWrFzyV+bZTj5jqCyBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKryH6Tj2BDjiQy7ZElcxS6hA+hheaxAIi/zgNCfJyHidOzzQX
	5FtMMjyWJXYr1+kCre1etY12Tbm2dKdAzAQ1eL4hN9nZl3pH+WyPlb15ZZSZGyWTmrlu7UkfkN4
	z2bEmVC/9JaWlpLbXJyahkbllR6W1EXqRDPaLE+OxydD/jbp0VlAxqDmkqeh8NPTn8g==
X-Gm-Gg: ATEYQzzgTqz6VzEtO4QwbaI6sjh6wHWQYrULnmxbpZz+3ML/H9AlDML+xzuvw9nMR0d
	+mtpcxIMbzvTU1Q3VmMMrNWWYrg1mp7Xgpa2bjEulTuBPNooDDJif5/AoqpaCZL7wW0cWlE/9ob
	q0h1mu+jR6SDv4mYlk0oKAdKZrzsFcKKjYjqZSWX86QN++Y33MsBNc/HK1bXbKwt1SXqaMYyIOK
	6eIv1JkhaRnv/Wy6zr9v7W2tx44IJS/qR64UJppX0IQb/Q496VuxasMyn/iq5Cyoh9SGfW3n6yi
	urOwowaSZ1wQ3lZOkI3CTul6EAwoYXhK6dJH9WwvTqRuJ7RPTHeb/RrMMNHw91WtdAYG1w+2zaO
	1yq/npopy6ge8laL8Jg+aB5KjCguvRtdqGPLyK9vRTfOmv4rWU9QnR1TybQhw6Rdy6vbjtId4Nk
	SzEpzDfdMBHtEBggckE9ipyep2vaHmDaMfYt8=
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1249962485a.77.1773033168463;
        Sun, 08 Mar 2026 22:12:48 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1249960985a.77.1773033168085;
        Sun, 08 Mar 2026 22:12:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0e6sm1953869e87.55.2026.03.08.22.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:12:47 -0700 (PDT)
Date: Mon, 9 Mar 2026 07:12:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: add ADSP GPR
Message-ID: <rv3p3xhx7ge2cfn2mefad6joffmvqhp4yta7yifzufvv53hs3h@qb2le6csplir>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
X-Proofpoint-ORIG-GUID: vrGECpRn6iyE2mz4f8a0qIt5a_q6Yc86
X-Proofpoint-GUID: vrGECpRn6iyE2mz4f8a0qIt5a_q6Yc86
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae56d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qELz02of8CWT8vQxZsoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA0NiBTYWx0ZWRfX+jVAO0GNnA5h
 jCln0j+JSuYUoLF51LdtsiVZ4dUhB3GnXqU+HYbiN+JG/cU8HkdM48NNaorOJZG38hrKaoRWPU3
 x2JxCkbAqHE55sRqYTn7+ofaMkaeYoF4OrhZ7XcAJPvHX/5ujhkstDB9iv86eF0eB1z1Prg+TPN
 MKnW+5suiskHWNX3O5sMjPh+8G8Ld/y6YRS0qcW5dXo5KecqooGpXzCMjj+wIMAahhUMDEPsngG
 nfInpNJJSyNKaBGNtfS1YNYNNOuhsmIwcOZlulnKll8BlkX1L0xPvekFjCDbYi4NUG5uMlEwFhk
 CV4M6ter8tL7rdRl8Iq2aUA7f2plH70v8cLTd1Wx8PTKvQZmTVbINBhTqjdd1PB1imgipbn2F7s
 qWLf9CxgAw738DVe4jhUmII4wkjYDIpPTXfSb2mXOhSN1mt6BdOrjtit5nqvjlT4N9SkC3ostJ6
 Z/AjlAolf/qqRrz3NuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090046

On Fri, Mar 06, 2026 at 03:01:20PM +0100, Luca Weiss wrote:
> Add the ADSP Generic Packet Router (GPR) device node as part of audio
> subsystem in Qualcomm Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 41 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
